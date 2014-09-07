class AddIndexForAgenda < ActiveRecord::Migration
  def change
    add_index :agendas, [:funcionario_id, :dt_agendada, :hr_inicio], :unique=>true, :name=>"index_for_agendas_on_funcionario_and_hr_inic_and_dt_agendada"
  end
end
