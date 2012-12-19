class AddEnrollmentIdToSelecaoAdminLectures < ActiveRecord::Migration
  def change
    add_column :selecao_admin_lectures, :enrollment_id, :integer
  end
end
