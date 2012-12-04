class CreateSelecaoAdminDrawingEnrolleds < ActiveRecord::Migration
  def change
    create_table(:selecao_admin_drawing_enrolleds) do |t|
      t.references :drawing
      t.references :enrolled

      t.timestamps
    end
    add_index :selecao_admin_drawing_enrolleds, :drawing_id
    add_index :selecao_admin_drawing_enrolleds, :enrolled_id
  end
end
#20120903143835