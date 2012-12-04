class AddCodeIndexToSelecaoAdminStates < ActiveRecord::Migration
  def change
    add_index :selecao_admin_states, :code
  end
end
