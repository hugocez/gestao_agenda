class FaixaFuncionarioServico < ActiveRecord::Base
  belongs_to :funcionario_servico
  
  validates :dia_semana, :uniqueness => {:scope => [:dia_semana,:hr_inicio,:valor_base]}
  
  #validates :dia_semana,:hr_inicio,:valor_base, uniqueness: true 
  
  
  
end
