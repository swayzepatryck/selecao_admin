module SelecaoAdmin
  class SurveyQuestion < ActiveRecord::Base
    belongs_to :survey, :inverse_of => :survey_questions
    has_many :survey_question_options, :inverse_of => :survey_question
    
    accepts_nested_attributes_for :survey_question_options, :allow_destroy => true
    attr_accessible :number_of_options, :question, :survey_question_options_attributes, :sequence_number
    
    validates_presence_of :question, :sequence_number
    validates_uniqueness_of :question, :scope => :survey_id    
    
    default_scope order('sequence_number')
    
  end
end
