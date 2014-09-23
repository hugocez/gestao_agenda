class AddNomeClienteToAgendas < ActiveRecord::Migration
  def change
    add_column :agendas, :nome_cliente, :string
  end
end
