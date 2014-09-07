module AgendasHelper
  
  def agenda_funcionario (funcionario, data, hora)
    
    @compromisso = @agenda.where(["funcionario_id = ? and hr_inicio = ? and dt_agendada = ?", funcionario, hora, data])
    
    
  end
  
end
