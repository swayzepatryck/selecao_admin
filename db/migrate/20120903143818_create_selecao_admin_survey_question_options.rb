class CreateSelecaoAdminSurveyQuestionOptions < ActiveRecord::Migration
  def change
    create_table :selecao_admin_survey_question_options do |t|
      t.belongs_to :survey_question
      t.string :option
      t.boolean :is_others

      t.timestamps
    end
    add_index :selecao_admin_survey_question_options, :survey_question_id, :name => 'sa_survey_question_options_survey_question_id'
  end
end
