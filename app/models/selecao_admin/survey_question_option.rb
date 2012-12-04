module SelecaoAdmin
  class SurveyQuestionOption < ActiveRecord::Base
    belongs_to :survey_question, :inverse_of => :survey_question_options
    attr_accessible :is_others, :option, :sequence_number
    
    has_many :enrolled_survey_answers
    has_many :enrolleds, :through => :enrolled_survey_answers
    
    validates_presence_of :option, :sequence_number
    default_scope order('sequence_number')
    
    validates_uniqueness_of :option, :scope => :survey_question_id
    
    
  end
end
