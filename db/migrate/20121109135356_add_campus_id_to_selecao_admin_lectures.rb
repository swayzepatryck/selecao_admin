class AddCampusIdToSelecaoAdminLectures < ActiveRecord::Migration
  def change
    add_column :selecao_admin_lectures, :campus_id, :integer
  end
end
