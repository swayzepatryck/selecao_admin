class AddGoalToSelecaoAdminCourses < ActiveRecord::Migration
  def change
    add_column :selecao_admin_courses, :goal, :text
  end
end
