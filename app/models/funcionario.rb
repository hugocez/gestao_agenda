class Funcionario < ActiveRecord::Base
  
  belongs_to :Empresas
  has_one :Users
  
end
