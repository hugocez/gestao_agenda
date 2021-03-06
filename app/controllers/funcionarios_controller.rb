class FuncionariosController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy]
  
  def new
    @funcionario = Funcionario.new
  end

  def create
    @funcionario = Funcionario.new(funcionario_params)
    @funcionario.empresa_id = encontrar_empresa
    if @funcionario.save
      flash[:success] = "Funcionario Cadastrado Com Sucesso!"
      redirect_to funcionarios_path
    else
      render 'new'
    end
  end
  
  def update
    @funcionario = Funcionario.find(params[:id])
    
    if @funcionario.user == nil
      u = User.new(usuario_params)
      u.name = params[:funcionario][:nome]
      @funcionario.user = u
    end  
      
    if @funcionario.update_attributes(funcionario_params)
      flash[:success] = "Cadastro Atualizado!"
      redirect_to funcionarios_path
    else
      render 'edit'
    end
  end

  def destroy
    @funcionario = Funcionario.find(params[:id])
    user = current_user
    if @funcionario.user
      if user.id = @funcionario.user.id
        flash[:warning] = "Voce nao pode excluir o funcionario atrelado ao seu usuario"
      else
        @funcionario.user.destroy
        if @funcionario.destroy
          flash[:success] = "Cadastro Atualizado!"
        end
      end
    else
      if @funcionario.destroy
          flash[:success] = "Funcionario Excluido com Sucesso!"
      end
    end
    redirect_to funcionarios_path
  end

  def show
    @funcionario = Funcionario.find(params[:id])
  end

  def edit
    @funcionario = Funcionario.find(params[:id])
  end
  
  def index 
    
    if params[:empresa_loja_id] != nil
      @funcionarios = Funcionario.where(["empresa_loja_id = ?", params[:empresa_loja_id]]).paginate(page: params[:page])
    else
      user = current_user
      if user.funcionario.empresa_loja_id == nil
        empresa_id = encontrar_empresa
        @funcionarios = Funcionario.where(["empresa_id = ?", empresa_id]).paginate(page: params[:page])
      else
        @funcionarios = Funcionario.where(["empresa_loja_id = ?", user.funcionario.empresa_loja_id]).paginate(page: params[:page])
      end
    end 
    
  end
  
  private

    def funcionario_params
      params.require(:funcionario).permit(:nome, :cpf, :data_nasc,:empresa_loja_id)
    end
    
    def usuario_params
      params.require(:user).permit(:email,:password,:password_confirmation)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
    
end
