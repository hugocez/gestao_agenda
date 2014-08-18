class TipoServicosController < ApplicationController
  def new
    @tiposervico = TipoServico.new
  end

  def create
    @tiposervico = TipoServico.new(tipo_servico_params)
    if @tiposervico.save
      flash[:success] = "Tipo de Servico incluido com sucesso"
      redirect_to @tiposervico
    else
      render 'new'
    end
  end

  def index
    @tiposervico = TipoServico.all.paginate(page: params[:page])
  end

  def show
    @tiposervico = TipoServico.find(params[:id])
  end

  def edit
  end
  
  private
    
    def tipo_servico_params
      params.require(:tipo_servico).permit(:descricao)
    end
end
