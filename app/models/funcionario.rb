class Funcionario < ActiveRecord::Base
  
  belongs_to :empresa
  belongs_to :empresa_loja
  has_one :user
  has_many :funcionario_servicos
  has_many :agendas
  
  validates :nome, presence:true, length:{maximum:70}
  
end
