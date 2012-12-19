class AddAnnouncementFileColumnsToAnnouncements < ActiveRecord::Migration
  def self.up
    change_table :selecao_admin_announcements do |t|
      t.has_attached_file :announcement_file
    end
  end

  def self.down
    drop_attached_file :selecao_admin_announcements, :announcement_file
  end
end
