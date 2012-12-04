class AddSequenceNumberToSelecaoAdminSurveyQuestionOption < ActiveRecord::Migration
  def change
    add_column :selecao_admin_survey_question_options, :sequence_number, :integer
  end
end
