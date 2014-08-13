class EmpresasController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update, :show, :destroy]
  
  def new
    @empresa = Empresa.new
  end
  

  def show
     @empresa = Empresa.find(params[:id])
  end

  def delete
  end

  def create
    
    @empresa = Empresa.new(empresa_params)

      if @empresa.save
        p = "123456"
        func = Funcionario.create(nome: "ADMINISTRADOR", empresa_id: @empresa.id)
        user = User.create(name: params[:empresa][:razao_social], email: params[:empresa][:email], password: p, password_confirmation: p,funcionario_id: func.id)
        sign_in user
        flash[:success] = "Seja Bem Vindo ao Sistema Exemplo!"
        redirect_to @empresa
      else
        render :new
        
      end
    
  end

  def update
  end

  def index
    @empresas = Empresa.all
  end

  private
    
    def empresa_params
      params.require(:empresa).permit(:razao_social, :cnpj, :data_abertura, :email)
    end
    
end