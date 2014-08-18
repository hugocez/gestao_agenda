class CreateFuncionarioEmpresaLojas < ActiveRecord::Migration
  def change
    create_table :funcionario_empresa_lojas do |t|
      t.integer :empresa_loja_id
      t.integer :funcionario_id

      t.timestamps
    end
  end
end
