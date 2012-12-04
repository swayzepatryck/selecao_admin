class AddAttendanceLecturePresenceStatusIdToSelecaoAdminLecturePresences < ActiveRecord::Migration
  def change
    add_column :selecao_admin_lecture_presences, :attendance_lecture_presence_status_id, :integer
  end
end
