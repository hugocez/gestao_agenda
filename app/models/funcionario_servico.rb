class FuncionarioServico < ActiveRecord::Base
  belongs_to :funcionario
  belongs_to :servico
  has_many :faixa_funcionario_servicos
  has_many :agendas
  
  validates :servico_id, presence: true
  validates :funcionario_id, presence: true
  validates :perc_comissao, presence: true
end
