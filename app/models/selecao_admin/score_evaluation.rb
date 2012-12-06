module SelecaoAdmin
  class ScoreEvaluation < ActiveRecord::Base
    attr_accessible :title, :discipline_ids
    
    has_many :score_evaluation_disciplines
    has_many :disciplines, :through => :score_evaluation_disciplines
    validates_presence_of :disciplines
    
    has_many :enrollment_score_evaluations
    has_many :enrollments, :through => :enrollment_score_evaluations, :dependent => :restrict    
    
    validates_presence_of :title
    validates_uniqueness_of :title
    
    def self.icon
      return 'icon-pencil'
    end           
    
  end
end
