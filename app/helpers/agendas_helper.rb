module AgendasHelper
  
  def agenda_funcionario (funcionario, data, hora)
    
    @compromisso = Agenda.where(["funcionario_id = ? and hr_inicio = ? and dt_agendada = ?", funcionario, hora, data])
	
  end
  
  def funcionario_disponivel (funcionario, dia_da_semana, hora)
  
	@disponibilidade = false
	servicos = FuncionarioServico.where(["funcionario_id = ?", funcionario.id])
	servicos.each do |s|
	
		hora = "2000-01-01 " + hora
		a = FaixaFuncionarioServico.where(['(dia_semana = ? or dia_semana = 0) and hr_inicio <= ? and hr_fim >= ? and funcionario_servico_id = ?', dia_da_semana, hora, hora, s.id])
		if a.count > 0
			@disponibilidade = true
		end	
	end
    
  end
  
end
