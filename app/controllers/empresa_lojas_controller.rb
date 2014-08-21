class EmpresaLojasController < ApplicationController
  
  before_action :signed_in_user
  
  def new
    @empresaloja = EmpresaLoja.new()
  end

  def create
    @empresaloja = EmpresaLoja.new(loja_params)
    @empresaloja.empresa_id = encontrar_empresa
    
    if @empresaloja.save
      flash[:success] = "Loja cadastrada com sucesso!"
      redirect_to empresa_lojas_path
    else
      render 'new'
    end
  end

  def index
    empresa_id = encontrar_empresa
    @empresa_lojas = EmpresaLoja.where(["empresa_id = ?", empresa_id]).paginate(page: params[:page])
  end

  def show
    @empresaloja = EmpresaLoja.find(params[:id])
  end

  def edit
  end
  
  private
  
    def loja_params
      params.require(:empresa_loja).permit(:nome, :cep, :logradouro, :nro_logradouro, :compl_logradouro, :bairro, :cidade, :uf)
    end
  
end
