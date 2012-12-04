class RemoveNumberOfQuestionFromSurveyQuestions < ActiveRecord::Migration
  def up
    remove_column :selecao_admin_survey_questions, :number_of_options
  end

  def down
    add_column :selecao_admin_survey_questions, :number_of_options, :integer
  end
end
