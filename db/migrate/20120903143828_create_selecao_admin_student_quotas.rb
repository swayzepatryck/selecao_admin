class CreateSelecaoAdminStudentQuotas < ActiveRecord::Migration
  def change
    create_table :selecao_admin_student_quotas do |t|
      t.string :title
      t.string :abbreviation

      t.timestamps
    end
  end
end
