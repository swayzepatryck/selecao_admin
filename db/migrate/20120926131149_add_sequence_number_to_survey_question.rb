class AddSequenceNumberToSurveyQuestion < ActiveRecord::Migration
  def change
    add_column :selecao_admin_survey_questions, :sequence_number, :integer
  end
end
