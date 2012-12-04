class CreateSelecaoAdminDrawingStudentQuotas < ActiveRecord::Migration
  def change
    create_table(:selecao_admin_drawing_student_quotas) do |t|
      t.references :drawing
      t.references :student_quota
      t.integer :number_of_vacancies

      t.timestamps
    end
    add_index :selecao_admin_drawing_student_quotas, :drawing_id
    add_index :selecao_admin_drawing_student_quotas, :student_quota_id
  end
end
