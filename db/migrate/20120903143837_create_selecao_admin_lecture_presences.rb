class CreateSelecaoAdminLecturePresences < ActiveRecord::Migration
  def change
    create_table(:selecao_admin_lecture_presences) do |t|
      t.references :enrolled
      t.references :lecture

      t.timestamps
    end
    add_index :selecao_admin_lecture_presences, :enrolled_id, :name => 'sa_lecture_presences_enrolled_id'
    add_index :selecao_admin_lecture_presences, :lecture_id, :name => 'sa_lecture_presences_lecture_id'
  end
end

# 20120903143837


