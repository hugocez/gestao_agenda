class FuncionariosController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy]
  
  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(user_params)
    if @funcionario.save
      flash[:success] = "Funcionario Cadastrado Com Sucesso!"
      redirect_to @funcionario
    else
      render 'new'
    end
  end

  def delete
    
  end

  def show
    @funcionario = Funcionario.find(params[:id])
  end

  def edit
  end
  
  def index
    empresa_id = encontrar_empresa
    @funcionarios = Funcionario.where(["empresa_id = ?", empresa_id]).paginate(page: params[:page])
  end
  
  private

    def user_params
      params.require(:funcionario).permit(:nome, :cpf, :data_nasc)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
  
end
