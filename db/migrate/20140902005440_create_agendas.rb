class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.integer :funcionario_servico_id
      t.date :dt_agendada
      t.time :hr_inicio
      t.decimal :valor_final
      t.integer :cliente_id
      t.boolean :fg_finalizado

      t.timestamps
    end
  end
end
