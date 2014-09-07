class AddFuncionarioServicoIdForAgenda < ActiveRecord::Migration
  def change
    add_column :agendas, :funcionario_servico_id, :integer
  end
end
