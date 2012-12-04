class CreateSelecaoAdminCourses < ActiveRecord::Migration
  def change
    create_table :selecao_admin_courses do |t|
      t.string :name
      t.text :description
      t.belongs_to :course_shift
      t.belongs_to :course_situation
      t.belongs_to :campus
      t.string :info_link

      t.timestamps
    end
    add_index :selecao_admin_courses, :course_shift_id
    add_index :selecao_admin_courses, :course_situation_id
    add_index :selecao_admin_courses, :campus_id
  end
end
