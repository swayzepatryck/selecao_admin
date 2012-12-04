class CreateSelecaoAdminLectures < ActiveRecord::Migration
  def change
    create_table :selecao_admin_lectures do |t|
      t.string :title
      t.string :video_url

      t.timestamps
    end
  end
end