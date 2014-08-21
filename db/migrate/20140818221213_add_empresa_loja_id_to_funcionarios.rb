class AddEmpresaLojaIdToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :empresa_loja_id, :integer
  end
end
