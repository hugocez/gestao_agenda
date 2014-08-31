class AddIndexForFaixaFuncionario < ActiveRecord::Migration
  def change
    add_index :faixa_funcionario_servicos, [:dia_semana, :hr_inicio, :hr_fim, :valor_base], :unique=>true
  end
end
