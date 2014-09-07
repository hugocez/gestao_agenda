class RemoveFuncionarioServicoIdFromAgenda < ActiveRecord::Migration
  def change
    remove_column :agendas, :funcionario_servico_id, :integer
    add_column :agendas, :funcionario_id, :integer
  end
end
