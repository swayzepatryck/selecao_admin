class AddScoreEvaluationIdToSelecaoAdminEnrolledScores < ActiveRecord::Migration
  def change
    add_column :selecao_admin_enrolled_scores, :score_evaluation_id, :integer
  end
end
