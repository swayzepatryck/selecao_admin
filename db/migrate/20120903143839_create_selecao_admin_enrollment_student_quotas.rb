class CreateSelecaoAdminEnrollmentStudentQuotas < ActiveRecord::Migration
  def change
    create_table(:selecao_admin_enrollment_student_quotas)  do |t|
      t.references :enrollment
      t.references :student_quota

      t.timestamps
    end
    add_index :selecao_admin_enrollment_student_quotas, :enrollment_id, :name => 'sa_enrollment_student_quota_enrollment_id'
    add_index :selecao_admin_enrollment_student_quotas, :student_quota_id, :name => 'sa_enrollment_student_quota_student_quota_id'
  end
end

#20120903143839