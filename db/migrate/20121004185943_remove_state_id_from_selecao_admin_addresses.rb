class RemoveStateIdFromSelecaoAdminAddresses < ActiveRecord::Migration
  def up
    remove_column :selecao_admin_addresses, :state_id
  end

  def down
    add_column :selecao_admin_addresses, :state_id, :integer
  end
end
