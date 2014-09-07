class AgendasController < ApplicationController
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
    @tempo = "2000-01-01 08:00:00".to_time(:utc)
    @funcionario = Funcionario.where(["empresa_loja_id = ?", current_user.funcionario.empresa_loja_id])
  end

  def edit
  end
  
  def create
    @agenda = Agenda.new(agenda_params)
        
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
end
