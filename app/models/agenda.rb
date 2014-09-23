class Agenda < ActiveRecord::Base

  belongs_to :funcionario
  belongs_to :funcionario_servico
  belongs_to :cliente
 
end
