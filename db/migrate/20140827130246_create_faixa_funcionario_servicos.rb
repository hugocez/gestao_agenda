class CreateFaixaFuncionarioServicos < ActiveRecord::Migration
  def change
    create_table :faixa_funcionario_servicos do |t|
      t.integer :funcionario_servico_id
      t.integer :dia_semana
      t.time :hr_inicio
      t.time :hr_fim
      t.decimal :valor_base
      t.integer :duracao

      t.timestamps
    end
  end
end
