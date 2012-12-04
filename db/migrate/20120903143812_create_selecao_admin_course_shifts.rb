class CreateSelecaoAdminCourseShifts < ActiveRecord::Migration
  def change
    create_table :selecao_admin_course_shifts do |t|
      t.string :title

      t.timestamps
    end
  end
end
