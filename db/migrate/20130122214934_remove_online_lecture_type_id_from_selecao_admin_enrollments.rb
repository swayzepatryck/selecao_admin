class RemoveOnlineLectureTypeIdFromSelecaoAdminEnrollments < ActiveRecord::Migration
  def up
    remove_column :selecao_admin_enrollments, :online_lecture_type_id
  end

  def down
    add_column :selecao_admin_enrollments, :online_lecture_type_id, :integer
  end
end
