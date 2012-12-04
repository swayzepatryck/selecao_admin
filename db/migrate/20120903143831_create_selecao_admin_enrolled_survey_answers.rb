class CreateSelecaoAdminEnrolledSurveyAnswers < ActiveRecord::Migration
  def change
    create_table(:selecao_admin_enrolled_survey_answers, :id => false) do |t|
      t.references :survey_question_option
      t.references :enrolled
      t.string :other_option
      t.belongs_to :enrollment

      t.timestamps
    end
    add_index :selecao_admin_enrolled_survey_answers, :survey_question_option_id, :name => 'sa_enrolled_survey_answers_survey_question_option_id'
    add_index :selecao_admin_enrolled_survey_answers, :enrolled_id, :name => 'sa_enrolled_survey_answers_enrolled_id'
    add_index :selecao_admin_enrolled_survey_answers, :enrollment_id, :name => 'sa_enrolled_survey_answers_enrollment_id'
  end
end
