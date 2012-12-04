class CreateSelecaoAdminAnnouncements < ActiveRecord::Migration
  def change
    create_table :selecao_admin_announcements do |t|
      t.string :title
      t.date :publication_date

      t.timestamps
    end
  end
end
