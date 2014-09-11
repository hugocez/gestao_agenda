class ClientesController < ApplicationController

  before_action :signed_in_user

  def new
    @cliente = Cliente.new
  end

  def create
    @cliente = Cliente.new(cliente_params)
    if @cliente.save
      flash[:sucess] = "Cliente incluido com sucesso!"
      redirect_to clientes_path
    else
      render 'new'
    end
  end

  def edit
    @cliente = Cliente.find(params[:id])
  end

  def update
    @cliente = Cliente.find(params[:id])
    if @cliente.update_attributes(cliente_params)
      flash[:success] = "Cliente Atualizado com Sucesso!"
      redirect_to clientes_path
    else
      render 'edit'
    end 
  end

  def show
    @cliente = Cliente.find(params[:id])
  end

  def index
    @clientes = Cliente.all.paginate(page: params[:page])
  end
  
  private
  
    def cliente_params
      params.require(:cliente).permit(:nome, :cpf, :data_nasc, :sexo, :cep, :logradouro, :nro_logradouro, :compl_logradouro, :bairro, :cidade, :uf)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end  
end
