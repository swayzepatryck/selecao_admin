class CreateSelecaoAdminOnlineLectureCodes < ActiveRecord::Migration
  def change
    create_table :selecao_admin_online_lecture_codes do |t|
      t.string :code
      t.belongs_to :lecture

      t.timestamps
    end
    add_index :selecao_admin_online_lecture_codes, :online_lecture_id
  end
end
