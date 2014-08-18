class FuncionarioEmpresaLoja < ActiveRecord::Base
  belongs_to :empresa_loja
  belongs_to :funcionario
end
