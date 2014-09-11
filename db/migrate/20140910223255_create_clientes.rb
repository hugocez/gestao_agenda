class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nome
      t.string :cpf
      t.date :data_nasc
      t.integer :sexo
      t.string :cep
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
