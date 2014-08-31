class FaixaFuncionarioServico < ActiveRecord::Base
  belongs_to :funcionario_servico
  
  def escreve_dia_semana (dia_semana_num)
      case dia_semana_num
        when 0
          "Todos"
        when 1
          "Domingo"
        when 2
          "Segunda"
        when 3
          "Terca"
        when 4
          "Quarta"
        when 5
          "Quinta"
        when 6
          "Sexta"
        when 7
          "Sabado"
        
      end
    end
  
end
