class Servico < ActiveRecord::Base
  
  belongs_to :empresa
  belongs_to :tipo_servico
  has_many :funcionario_servicos
  
  validates :descricao, presence: true, length: { maximum: 30 }
  validates :tipo_servico_id, presence: true
  validates :empresa_id, presence: true
  
end
