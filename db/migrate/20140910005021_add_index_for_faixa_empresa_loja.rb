class AddIndexForFaixaEmpresaLoja < ActiveRecord::Migration
  def change
    add_index :faixa_empresa_lojas, :dia_semana, :unique=>true
  end
end
