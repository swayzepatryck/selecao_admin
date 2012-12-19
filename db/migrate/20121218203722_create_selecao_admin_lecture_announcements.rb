class CreateSelecaoAdminLectureAnnouncements < ActiveRecord::Migration
  def change
    create_table :selecao_admin_lecture_announcements do |t|
      t.belongs_to :lecture
      t.belongs_to :announcement

      t.timestamps
    end
    add_index :selecao_admin_lecture_announcements, :lecture_id
    add_index :selecao_admin_lecture_announcements, :announcement_id
  end
end
