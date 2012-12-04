class CreateSelecaoAdminCoursePrerequisites < ActiveRecord::Migration
  def change
    create_table :selecao_admin_course_prerequisites do |t|
      t.belongs_to :course
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :selecao_admin_course_prerequisites, :course_id
  end
end
