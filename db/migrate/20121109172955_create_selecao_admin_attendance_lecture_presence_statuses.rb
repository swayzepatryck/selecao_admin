class CreateSelecaoAdminAttendanceLecturePresenceStatuses < ActiveRecord::Migration
  def change
    create_table :selecao_admin_attendance_lecture_presence_statuses do |t|
      t.string :title

      t.timestamps
    end
  end
end
