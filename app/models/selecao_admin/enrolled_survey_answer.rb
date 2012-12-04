module SelecaoAdmin
  class EnrolledSurveyAnswer < ActiveRecord::Base
    belongs_to :survey_question_option
    belongs_to :enrolled
    belongs_to :enrollment
    attr_accessible :other_option, :survey_question_option_id, :enrolled_id, :enrollment_id
  end
end
