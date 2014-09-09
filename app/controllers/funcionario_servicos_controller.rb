class FuncionarioServicosController < ApplicationController
  
  before_action :signed_in_user
  
  def new
    @funcionario = Funcionario.find(params[:funcionario_id])
    @funcionarioServico = FuncionarioServico.new
    @funcionarioServico.funcionario = @funcionario
  end

  def create
    @funcionarioServico = FuncionarioServico.new(funcionario_servico_params)
    if @funcionarioServico.save
      flash[:success] = "Servico Incluido com Sucesso!"
      redirect_to funcionario_servicos_path(:funcionario_id => @funcionarioServico.funcionario)
    else
   
      render 'new', :locale => @funcionarioServico.funcionario
      
    end
  end
  
  def index
    if params[:funcionario_id] != nil
      @funcionario_servicos = FuncionarioServico.where(["funcionario_id = ?", params[:funcionario_id]]).paginate(page: params[:page]) 
    end
    if @funcionario_servicos.count == 0
      flash[:warning] = "Funcionario Sem Servicos Cadastrados. Favor Cadastrar o Primeiro Servico."
      redirect_to new_funcionario_servico_path( :funcionario_id => params[:funcionario_id])    
    end
  end

  def show
    @funcionarioServico = FuncionarioServico.find(params[:id])
  end

  def edit
    @funcionarioServico = FuncionarioServico.find(params[:id])
  end
  
  def update
    @funcionarioServico = FuncionarioServico.find(params[:id])
    if @funcionarioServico.update_attributes(funcionario_servico_params)
      flash[:success] = "Servico Atualizado!"
      redirect_to funcionario_servicos_path(:funcionario_id => @funcionarioServico.funcionario)
    else
      render 'edit', :locale => @funcionarioServico.funcionario
    end 
  end
  
  def destroy
    @funcionarioServico = FuncionarioServico.find(params[:id])
    if @funcionarioServico.destroy
      flash[:success] = "Servico Excluido com Sucesso!"
      redirect_to funcionario_servicos_path(:funcionario_id => @funcionarioServico.funcionario)
   end
  end
  
  private
    
    def funcionario_servico_params
      params.require(:funcionario_servico).permit(:funcionario_id, :servico_id, :valor_base, :perc_comissao)
    end
    
    def signed_in_user
      redirect_to signin_url, notice: "Por favor, faca o login." unless signed_in?
    end
end
