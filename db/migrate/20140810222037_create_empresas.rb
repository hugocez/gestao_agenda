class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :razao_social
      t.string :cnpj
      t.date :data_abertura

      t.timestamps
    end
  end
end
