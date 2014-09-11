class Cliente < ActiveRecord::Base
  
  validates :nome, presence: true
  validates :cep, presence: true, length: {maximum:8}
  validates :data_nasc, presence: true
  validates :sexo, presence:true
  
end
