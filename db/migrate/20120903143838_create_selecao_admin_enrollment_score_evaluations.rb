class CreateSelecaoAdminEnrollmentScoreEvaluations < ActiveRecord::Migration
  def change
    create_table(:selecao_admin_enrollment_score_evaluations, :id => false)  do |t|
      t.references :enrollment
      t.references :score_evaluation

      t.timestamps
    end
    add_index :selecao_admin_enrollment_score_evaluations, :enrollment_id, :name => 'sa_enrollment_score_evaluations_enrollment_id'
    add_index :selecao_admin_enrollment_score_evaluations, :score_evaluation_id, :name => 'sa_enrollment_score_evaluations_score_evaluation_id'
  end
end

#20120903143838_create_selecao_admin_entry_process_score_evaluations
#20120903143839_create_selecao_admin_entry_process_student_quotas


