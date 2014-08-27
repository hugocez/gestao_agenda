class FuncionarioServico < ActiveRecord::Base
  belongs_to :funcionario
  belongs_to :servico
  
  validates :servico_id, presence: true
  validates :funcionario_id, presence: true
  validates :perc_comissao, presence: true
end
