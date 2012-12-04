class AddUserIdToSelecaoAdminEnrolled < ActiveRecord::Migration
  def change
    add_column :selecao_admin_enrolleds, :user_id, :integer
  end
end
