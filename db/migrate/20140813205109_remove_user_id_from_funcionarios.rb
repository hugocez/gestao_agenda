class RemoveUserIdFromFuncionarios < ActiveRecord::Migration
  def change
    remove_column :funcionarios, :user_id, :integer
  end
end
