class AddAttendanceLecturePresenceStatuses < ActiveRecord::Migration
  def up
    SelecaoAdmin::AttendanceLecturePresenceStatus.create(:title => 'Agendado')
    SelecaoAdmin::AttendanceLecturePresenceStatus.create(:title => 'Presente')
  end

  def down
    SelecaoAdmin::AttendanceLecturePresenceStatus.delete_all
  end
end
