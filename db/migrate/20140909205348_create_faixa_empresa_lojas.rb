class CreateFaixaEmpresaLojas < ActiveRecord::Migration
  def change
    create_table :faixa_empresa_lojas do |t|
      t.integer :empresa_loja_id
      t.time :hr_inicio
      t.time :hr_fim
      t.integer :dia_semana

      t.timestamps
    end
  end
end
