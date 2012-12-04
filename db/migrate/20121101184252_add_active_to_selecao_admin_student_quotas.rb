class AddActiveToSelecaoAdminStudentQuotas < ActiveRecord::Migration
  def change
    add_column :selecao_admin_student_quotas, :active, :boolean
  end
end
