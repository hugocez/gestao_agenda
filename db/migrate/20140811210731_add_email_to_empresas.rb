class AddEmailToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :email, :string
  end
end
