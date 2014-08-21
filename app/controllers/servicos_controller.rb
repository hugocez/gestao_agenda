class ServicosController < ApplicationController
  
  before_action :signed_in_user
  
  def new
    @servico = Servico.new
  end

  def create
    @servico = Servico.new(servico_params)
    @servico.empresa_id = encontrar_empresa
    if @servico.save
      flash[:success] = "Tipo de Servico incluido com sucesso"
      redirect_to @servico
    else
      render 'new'
    end
  end

  def index
    user = current_user
    if user.funcionario.empresa_loja_id == nil
      empresa_id = encontrar_empresa
      @servicos = Servico.where(["empresa_id = ?", empresa_id]).paginate(page: params[:page])
    else
      @servicos = Servico.where(["empresa_loja_id = ?", user.funcionario.empresa_loja_id]).paginate(page: params[:page])
    end
  end

  def show
    @servico = Servico.find(params[:id])
  end

  def edit
  end
  
  private
    
    def servico_params
      params.require(:servico).permit(:descricao,:tipo_servico_id,:empresa_loja_id)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
  
end
