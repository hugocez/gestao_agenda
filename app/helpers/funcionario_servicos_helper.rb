module FuncionarioServicosHelper
  
  def descricao_servico
    FuncionarioServico.find(1).descricao
  end
  
end
