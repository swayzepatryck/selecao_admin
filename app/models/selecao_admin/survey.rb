module SelecaoAdmin
  class Survey < ActiveRecord::Base
    attr_accessible :title, :survey_questions_attributes, :survey_code
    has_many :enrollments
    
    has_many :survey_questions, :inverse_of => :survey
    accepts_nested_attributes_for :survey_questions, :allow_destroy => true
    
    
    validates_presence_of :title, :survey_code
    validates_uniqueness_of :title
    
    
    def self.icon
      return 'icon-check'
    end           
    
    def short_title
      "#{self.survey_code} - #{self.title}"
    end
    
    def show_general_survey_report(survey_id)
      
    end
    
    
  end
end
