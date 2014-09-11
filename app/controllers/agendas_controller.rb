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
    @agenda = Agenda.all
    horario = FaixaEmpresaLoja.where(["empresa_loja_id = ?", current_user.funcionario.empresa_loja_id])
    if horario.count == 0
      @tempo = "2000-01-01 08:00:00".to_time(:utc)
      @fechamento = "2000-01-01 22:00:00".to_time(:utc)
    else if horario.count == 1
        @tempo = horario.first.hr_inicio
        @fechamento = horario.first.hr_fim
      else
        @tempo = horario.where(["dia_semana = ?", Date.today.wday]).hr_inicio
        @fechamento = horario.where(["dia_semana = ?", Date.today.wday]).hr_fim
      end 
    end
    @funcionario = Funcionario.includes(:funcionario_servicos).where(["empresa_loja_id = ?", current_user.funcionario.empresa_loja_id])
  end

  def edit
  end
  
  def create
    @agenda = Agenda.new(agenda_params)
    
    @agenda.funcionario_servico_id = FuncionarioServico.where(["funcionario_id = ? and servico_id = ?", @agenda.funcionario_id, @agenda.funcionario_servico_id]).first.id
        
    if @agenda.save
      flash[:sucess] = "Compromisso Incluido com sucesso!"
      redirect_to agendas_path
    else
      render 'new', :locale => @agenda.funcionario_id
    end
  end
  
  private
  
    def agenda_params
      params.require(:agenda).permit(:funcionario_id, :funcionario_servico_id, :hr_inicio, :dt_agendada)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
end
