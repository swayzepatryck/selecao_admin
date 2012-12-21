class AddEnrollmentIdToSelecaoAdminEnrolledScores < ActiveRecord::Migration
  def change
    add_column :selecao_admin_enrolled_scores, :enrollment_id, :integer
  end
end
