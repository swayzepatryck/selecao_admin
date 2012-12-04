class AddAnnouncementIdToSelecaoAdminLectures < ActiveRecord::Migration
  def change
    add_column :selecao_admin_lectures, :announcement_id, :integer
  end
end
