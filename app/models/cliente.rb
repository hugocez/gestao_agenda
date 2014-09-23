class Cliente < ActiveRecord::Base
  
  belongs_to :empresa
  has_many :agendas
  
  validates :nome, presence: true
  validates :cep, presence: true, length: {maximum:8}
  validates :data_nasc, presence: true
  validates :sexo, presence:true
  
end
