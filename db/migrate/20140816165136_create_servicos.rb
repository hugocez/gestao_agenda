class CreateServicos < ActiveRecord::Migration
  def change
    create_table :servicos do |t|
      t.string :descricao
      t.integer :tipo_servico_id
      t.integer :empresa_id

      t.timestamps
    end
  end
end
