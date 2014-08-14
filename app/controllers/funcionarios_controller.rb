class FuncionariosController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy]
  
  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    @funcionario.empresa_id = encontrar_empresa
    if @funcionario.save
      p = "123456"
      user = User.create(name: params[:funcionario][:nome], email:"seuemail@email.com", password: p, password_confirmation: p, funcionario_id: @funcionario.id)
      flash[:success] = "Funcionario Cadastrado Com Sucesso!"
      redirect_to edit_user_path(user)
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

    def funcionario_params
      params.require(:funcionario).permit(:nome, :cpf, :data_nasc, :email)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
    
    
  
end
