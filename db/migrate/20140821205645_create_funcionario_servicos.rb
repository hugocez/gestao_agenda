class CreateFuncionarioServicos < ActiveRecord::Migration
  def change
    create_table :funcionario_servicos do |t|
      t.integer :funcionario_id
      t.integer :servico_id
      t.decimal :valor_base
      t.decimal :perc_comissao

      t.timestamps
    end
  end
end
