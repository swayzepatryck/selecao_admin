class CreateSelecaoAdminEnrolledScores < ActiveRecord::Migration
  def change
    create_table :selecao_admin_enrolled_scores do |t|
      t.belongs_to :enrolled
      t.belongs_to :discipline
      t.float :score

      t.timestamps
    end
    add_index :selecao_admin_enrolled_scores, :enrolled_id
    add_index :selecao_admin_enrolled_scores, :discipline_id
  end
end
