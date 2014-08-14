class UsersController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy]
  before_action :correct_user, only: [:edit, :update]
  
  def new 
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Seja Bem Vindo ao Software de Gestao de Agenda Corporativa!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def index
    #@users = User.all.paginate(page: params[:page]) - Forma antiga - sem filtrar a empresa
    eid = encontrar_empresa
    @users = User.joins(:funcionario).where(["funcionarios.empresa_id = ?", eid]).paginate(page: params[:page])
  end

  def edit
    
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
  
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user) 
    end
    
    
end  