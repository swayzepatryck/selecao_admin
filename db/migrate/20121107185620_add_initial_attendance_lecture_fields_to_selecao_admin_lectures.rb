class AddInitialAttendanceLectureFieldsToSelecaoAdminLectures < ActiveRecord::Migration
  def change
    add_column :selecao_admin_lectures, :lecture_date, :date
    add_column :selecao_admin_lectures, :lecture_time, :datetime
    add_column :selecao_admin_lectures, :max_capacity, :integer
  end
end
