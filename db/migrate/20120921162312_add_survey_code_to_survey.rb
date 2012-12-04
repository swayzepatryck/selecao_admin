class AddSurveyCodeToSurvey < ActiveRecord::Migration
  def change
    add_column :selecao_admin_surveys, :survey_code, :string
  end
end
