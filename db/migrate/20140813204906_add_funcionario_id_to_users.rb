class AddFuncionarioIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :funcionario_id, :integer
  end
end
