class AddCourseCodeToCourse < ActiveRecord::Migration
  def change
    add_column :selecao_admin_courses, :course_code, :string
  end
end
