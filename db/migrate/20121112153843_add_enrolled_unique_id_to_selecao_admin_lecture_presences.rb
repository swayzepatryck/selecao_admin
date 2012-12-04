class AddEnrolledUniqueIdToSelecaoAdminLecturePresences < ActiveRecord::Migration
  def change
    add_column :selecao_admin_lecture_presences, :enrolled_unique_id, :string
  end
end
