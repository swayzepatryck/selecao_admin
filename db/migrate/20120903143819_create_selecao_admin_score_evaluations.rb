class CreateSelecaoAdminScoreEvaluations < ActiveRecord::Migration
  def change
    create_table :selecao_admin_score_evaluations do |t|
      t.string :title

      t.timestamps
    end
  end
end
