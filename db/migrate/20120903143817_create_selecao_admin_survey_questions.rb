class CreateSelecaoAdminSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :selecao_admin_survey_questions do |t|
      t.belongs_to :survey
      t.string :question
      t.integer :number_of_options

      t.timestamps
    end
    add_index :selecao_admin_survey_questions, :survey_id
  end
end
