class TipoServico < ActiveRecord::Base
  
  has_many :servicos
  
  validates :descricao, presence: true, length: { maximum: 30 }
  
end
