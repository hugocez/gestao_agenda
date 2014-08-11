class AddUserToFuncionarios < ActiveRecord::Migration
  def change
    add_column :funcionarios, :user_id, :integer
  end
end
