class RemoveOnlineLectureIdFromEnrollment < ActiveRecord::Migration
  def up
    remove_column :selecao_admin_enrollments, :online_lecture_id
  end

  def down
    add_column :selecao_admin_enrollments, :online_lecture_id, :integer
  end
end
