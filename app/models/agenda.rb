class Agenda < ActiveRecord::Base

  belongs_to :funcionario
  belongs_to :funcionario_servico
 
end
