class RemoveAnnouncementIdFromSelecaoAdminLectures < ActiveRecord::Migration
  def up
    remove_column :selecao_admin_lectures, :announcement_id
  end

  def down
    add_column :selecao_admin_lectures, :announcement_id, :integer
  end
end
