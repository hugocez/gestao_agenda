class CreateEmpresaLojas < ActiveRecord::Migration
  def change
    create_table :empresa_lojas do |t|
      t.string :nome
      t.integer :empresa_id
      t.integer :cep
      t.string :logradouro
      t.integer :nro_logradouro
      t.string :compl_logradouro
      t.string :bairro
      t.string :cidade
      t.string :uf

      t.timestamps
    end
  end
end
