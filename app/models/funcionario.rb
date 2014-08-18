class Funcionario < ActiveRecord::Base
  
  belongs_to :empresa
  has_one :user
  has_many :funcionario_empresa_lojas
end
