class FaixaFuncionarioServicosController < ApplicationController
  
  before_action :signed_in_user
  
  def new
    @funcionarioServico = FuncionarioServico.find(params[:funcionario_servico_id])
    @faixaFuncionarioServico = FaixaFuncionarioServico.new
    @faixaFuncionarioServico.funcionario_servico = @funcionarioServico
  end

  def create
    @faixaFuncionarioServico = FaixaFuncionarioServico.new(faixa_funcionario_servico_params)
    if @faixaFuncionarioServico.save
      flash[:success] = "Faixa Incluida com Sucesso!"
      redirect_to faixa_funcionario_servicos_path(:funcionario_servico_id => @faixaFuncionarioServico.funcionario_servico)
    else
      render 'new', :locale => @faixaFuncionarioServico.funcionario_servico  
    end
  end
  
  def update
    @faixaFuncionarioServico = FaixaFuncionarioServico.find(params[:id])
    if @faixaFuncionarioServico.update_attributes(faixa_funcionario_servico_params)
      flash[:success] = "Servico Atualizado!"
      redirect_to faixa_funcionario_servicos_path(:funcionario_servico_id => @faixaFuncionarioServico.funcionario_servico)
    else
      render 'edit', :locale => @faixaFuncionarioServico.funcionario_servico
    end
  end

  def show
     @faixaFuncionarioServico = FaixaFuncionarioServico.find(params[:id])
  end

  def edit
    @faixaFuncionarioServico = FaixaFuncionarioServico.find(params[:id])
  end

  def index
    @faixa_funcionario_servicos = FaixaFuncionarioServico.where(["funcionario_servico_id = ?", params[:funcionario_servico_id]]).paginate(page: params[:page])
  end
  
  def destroy
    @faixaFuncionarioServico = FaixaFuncionarioServico.find(params[:id])
    if @faixaFuncionarioServico.destroy
      flash[:success] = "Faixa Excluida Com Sucesso!"
      redirect_to faixa_funcionario_servicos_path(:funcionario_servico_id => @faixaFuncionarioServico.funcionario_servico)
    end
  end
  
  private
    
    def faixa_funcionario_servico_params
      params.require(:faixa_funcionario_servico).permit(:funcionario_servico_id, :dia_semana, :hr_inicio, :hr_fim, :valor_base, :duracao)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
    
end
