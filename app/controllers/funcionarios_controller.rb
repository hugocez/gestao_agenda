class FuncionariosController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy]
  
  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    @funcionario.empresa_id = encontrar_empresa
    if @funcionario.save
      #p = "123456"
      #user = User.create(name: params[:funcionario][:nome], email:"seuemail@email.com", password: p, password_confirmation: p, funcionario_id: @funcionario.id)
      flash[:success] = "Funcionario Cadastrado Com Sucesso!"
      redirect_to funcionario_path
    else
      render 'new'
    end
  end
  
  def update
    @funcionario = Funcionario.find(params[:id])
    u = User.new(usuario_params)
    u.name = params[:funcionario][:nome]
    if @funcionario.update_attributes(funcionario_params)
      @funcionario.user = u
      flash[:success] = "Cadastro Atualizado!"
      redirect_to @funcionario
    else
      render 'edit'
    end
  end

  def delete
    
  end

  def show
    @funcionario = Funcionario.find(params[:id])
  end

  def edit
    @funcionario = Funcionario.find(params[:id])
  end
  
  def index
    empresa_id = encontrar_empresa
    @funcionarios = Funcionario.where(["empresa_id = ?", empresa_id]).paginate(page: params[:page])
  end
  
  private

    def funcionario_params
      params.require(:funcionario).permit(:nome, :cpf, :data_nasc,:email,:password,:password_confirmation)
    end
    
    def usuario_params
      params.require(:user).permit(:email,:password,:password_confirmation)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
    
    
  
end
