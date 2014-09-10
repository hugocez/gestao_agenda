module ApplicationHelper
  
  def full_title (page_title)
    
    base_title = "Gestao de Agenda"
    
    if page_title.empty? 
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
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
