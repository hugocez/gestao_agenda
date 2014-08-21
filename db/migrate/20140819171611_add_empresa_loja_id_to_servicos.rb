class AddEmpresaLojaIdToServicos < ActiveRecord::Migration
  def change
    add_column :servicos, :empresa_loja_id, :integer
  end
end
