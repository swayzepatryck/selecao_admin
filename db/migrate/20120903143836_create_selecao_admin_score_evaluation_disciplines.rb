class CreateSelecaoAdminScoreEvaluationDisciplines < ActiveRecord::Migration
  def change
    create_table(:selecao_admin_score_evaluation_disciplines, :id => false) do |t|
      t.references :score_evaluation
      t.references :discipline

      t.timestamps
    end
    add_index :selecao_admin_score_evaluation_disciplines, :score_evaluation_id, :name => 'sa_score_evaluation_disciplines_score_evaluation_id'
    add_index :selecao_admin_score_evaluation_disciplines, :discipline_id, :name => 'sa_score_evaluation_disciplines_discipline_id'
  end
end
