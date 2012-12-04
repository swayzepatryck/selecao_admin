class RemoveEnrolledIdFromSelecaoAdminLecturePresences < ActiveRecord::Migration
  def up
    remove_column :selecao_admin_lecture_presences, :enrolled_id
  end

  def down
    add_column :selecao_admin_lecture_presences, :enrolled_id, :integer
  end
end
