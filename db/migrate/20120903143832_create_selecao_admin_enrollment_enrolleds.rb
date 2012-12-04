class CreateSelecaoAdminEnrollmentEnrolleds < ActiveRecord::Migration
  def change
    create_table(:selecao_admin_enrollment_enrolleds) do |t|
      t.references :enrolled
      t.references :enrollment
      t.belongs_to :student_quota
      t.belongs_to :score_evaluation

      t.timestamps
    end
    add_index :selecao_admin_enrollment_enrolleds, :enrolled_id
    add_index :selecao_admin_enrollment_enrolleds, :enrollment_id
    add_index :selecao_admin_enrollment_enrolleds, :student_quota_id
    add_index :selecao_admin_enrollment_enrolleds, :score_evaluation_id
  end
end

#20120903143832