class Funcionario < ActiveRecord::Base
  
  belongs_to :empresa
  has_one :user
  
end
