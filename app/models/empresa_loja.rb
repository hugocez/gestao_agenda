class EmpresaLoja < ActiveRecord::Base
  
  belongs_to :empresa
  has_many :funcionario_empresa_lojas
  has_many :faixa_empresa_lojas
  
  validates :nome, presence: true
  validates :cep, presence: true, length: {maximum:8}
  validates :logradouro, presence: true, length: {maximum:70}
  #validates :nro_logradouro
  validates :compl_logradouro, length: {maximum:20}
  validates :bairro, length: {maximum:20}
  validates :cidade, length: {maximum:40}
  validates :uf, length: {maximum:2}
  
end
