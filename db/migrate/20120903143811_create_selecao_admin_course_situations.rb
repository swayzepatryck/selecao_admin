class CreateSelecaoAdminCourseSituations < ActiveRecord::Migration
  def change
    create_table :selecao_admin_course_situations do |t|
      t.string :title

      t.timestamps
    end
  end
end
