class AddIndexForFaixaFuncionario < ActiveRecord::Migration
  def change
    add_index :faixa_funcionario_servicos, [:dia_semana, :hr_inicio, :valor_base], :unique=>true, :name=>"index_faixa_func_on_dia_semn_and_hr_inic_and_valor"
  end
end
