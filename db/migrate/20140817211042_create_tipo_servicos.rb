class CreateTipoServicos < ActiveRecord::Migration
  def change
    create_table :tipo_servicos do |t|
      t.string :descricao

      t.timestamps
    end
  end
end
