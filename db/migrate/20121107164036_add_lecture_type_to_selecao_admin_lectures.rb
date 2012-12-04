class AddLectureTypeToSelecaoAdminLectures < ActiveRecord::Migration
  def change
    add_column :selecao_admin_lectures, :lecture_type_id, :integer
  end
end
