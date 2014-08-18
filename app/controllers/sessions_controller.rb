class SessionsController < ApplicationController
  
  before_action :verifica_sessao, only: :new
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user 
      if user.authenticate(params[:session][:password])
        sign_in user
        redirect_to user
      else
        flash.now[:error] = 'Senha Invalida'
        render 'new'
      end
    else
      flash.now[:error] = 'Usuario Invalido'
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
  
  private
  
    def verifica_sessao
      if signed_in?
        redirect_to user_path current_user
      end
    end
  
end
