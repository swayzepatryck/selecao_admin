class AddLectureTypeIdToSelecaoAdminEnrollments < ActiveRecord::Migration
  def change
    add_column :selecao_admin_enrollments, :lecture_type_id, :integer
  end
end
