class FaixaEmpresaLojasController < ApplicationController
  def new
    @empresaLoja = EmpresaLoja.find(params[:empresa_loja_id])
    @faixaEmpresaLoja = FaixaEmpresaLoja.new
    @faixaEmpresaLoja.empresa_loja = @empresaLoja
  end

  def create
    @faixaEmpresaLoja = FaixaEmpresaLoja.new(faixa_empresa_loja_params)
    if @faixaEmpresaLoja.save
      flash[:success] = "Faixa Incluida com Sucesso!"
      redirect_to faixa_empresa_lojas_path(:empresa_loja_id => @faixaEmpresaLoja.empresa_loja)
    else
      render 'new', :locale => @faixaEmpresaLoja.empresa_loja  
    end
  end

  def edit
    @faixaEmpresaLoja = FaixaEmpresaLoja.find(params[:id])    
  end

  def show
    @faixaEmpresaLoja = FaixaEmpresaLoja.find(params[:id])
  end

  def index
    @faixa_empresa_lojas = FaixaEmpresaLoja.where(["empresa_loja_id = ?", params[:empresa_loja_id]]).paginate(page: params[:page])
    if @faixa_empresa_lojas.count == 0
      flash[:warning] = "Loja sem Faixas Cadastradas. Favor Cadastrar a Primeira Faixa."
      redirect_to new_faixa_empresa_loja_path( :empresa_loja_id => params[:empresa_loja_id])  
    end  
  end
  
  def update
    @faixaEmpresaLoja = FaixaEmpresaLoja.find(params[:id])
    if @faixaEmpresaLoja.update_attributes(faixa_empresa_loja_params)
      flash[:success] = "Faixa Atualizada!"
      redirect_to faixa_empresa_lojas_path(:empresa_loja_id => @faixaEmpresaLoja.empresa_loja_id)
    else
      render 'edit', :locale => @faixaEmpresaLoja.empresa_loja
    end
  end
  
  def destroy
    @faixaEmpresaLoja = FaixaEmpresaLoja.find(params[:id])
    if @faixaEmpresaLoja.destroy
      flash[:success] = "Faixa Excluida Com Sucesso!"
      redirect_to faixa_empresa_lojas_path(:empresa_loja_id => @faixaEmpresaLoja.empresa_loja_id)
    end  
  end
  
  private
    
    def faixa_empresa_loja_params
      params.require(:faixa_empresa_loja).permit(:empresa_loja_id, :dia_semana, :hr_inicio, :hr_fim)
    end
  
end
