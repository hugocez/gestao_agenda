class AgendasController < ApplicationController

  before_action :signed_in_user

  def new
    @agenda = Agenda.new
    @agenda.funcionario_id = params[:funcionario_id]
    @agenda.hr_inicio = params[:hr_inicio]
    @agenda.dt_agendada = params[:dt_agendada]
  end

  def show
    @agenda = Agenda.find(params[:id])
  end

  def index
    #@agenda = Agenda.joins(["INNER JOIN funcionarios fs ON fs.id = agendas.funcionario_id AND fs.empresa_id = " + current_user.funcionario.empresa_id.to_s])
    @agendas = Agenda.all
    horario = FaixaEmpresaLoja.where(["empresa_loja_id = ?", current_user.funcionario.empresa_loja_id])
    if params[:dt_agendada] == nil
      @dia_semana = Date.today.wday
      @data_pesquisa = Date.today
    else
      @dia_semana = params[:dt_agendada].to_date.wday
      @data_pesquisa = params[:dt_agendada].to_date
    end
    @disponibilidade = false
    if horario.count == 0
      @tempo = "2000-01-01 08:00:00".to_time(:utc)
      @fechamento = "2000-01-01 22:00:00".to_time(:utc)
    else if horario.count == 1
        @tempo = horario.first.hr_inicio
        @fechamento = horario.first.hr_fim
      else
        @tempo = horario.where(["dia_semana = ?", dia_semana]).hr_inicio
        @fechamento = horario.where(["dia_semana = ?", dia_semana]).hr_fim
      end 
    end
    @funcionario = Funcionario.includes(:funcionario_servicos).where(["empresa_loja_id = ?", current_user.funcionario.empresa_loja_id])
  end

  def edit
    @agenda = Agenda.find(params[:id])
  end
  
  def create
    @agenda = Agenda.new(agenda_params)
    
    @agenda.funcionario_servico_id = FuncionarioServico.where(["funcionario_id = ? and servico_id = ?", @agenda.funcionario_id, @agenda.funcionario_servico_id]).first.id
    
	if servico_disponivel == 0 
		flash[:warning] = "Tipo de Servico nao disponivel para o horario agendado. Favor Selecionar outro servico ou outro horario."
		render 'new', :locale => @agenda.funcionario_id
	else
        if @agenda.save
			flash[:sucess] = "Compromisso Incluido com sucesso!"
			redirect_to agendas_path
		else
			render 'new', :locale => @agenda.funcionario_id
		end
	end
  end
  
  private
  
    def agenda_params
      params.require(:agenda).permit(:funcionario_id, :funcionario_servico_id, :hr_inicio, :dt_agendada, :nome_cliente)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
	
	def servico_disponivel 
		hora = @agenda.hr_inicio
		dia_da_semana = @agenda.dt_agendada.wday + 1
		faixa_servico = FaixaFuncionarioServico.where(["funcionario_servico_id = ? and hr_inicio <= ? and hr_fim >= ? and (dia_semana = 0 or dia_semana = ?)", @agenda.funcionario_servico_id, hora, hora,dia_da_semana])
		qtde_servico = faixa_servico.count
	end
end
