class FaixaFuncionarioServicosController < ApplicationController
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
    
  end

  def destroy
    
  end

  def show
  end

  def edit
  end

  def index
  end
  
  private
    
    def faixa_funcionario_servico_params
      params.require(:faixa_funcionario_servico).permit(:funcionario_servico_id, :dia_semana, :hr_inicio, :hr_fim, :valor_base, :duracao)
    end
end
