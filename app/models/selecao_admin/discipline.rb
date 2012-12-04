module SelecaoAdmin
  class Discipline < ActiveRecord::Base
    attr_accessible :name
    
    validates_presence_of :name
    validates_uniqueness_of :name
    
    has_many :enrolled_scores
    has_many :enrolleds, :through => :enrolled_scores
    
    has_many :score_evaluation_disciplines
    has_many :score_evaluations, :through => :score_evaluation_disciplines, :dependent => :restrict    
    
    def self.icon
      return "icon-certificate"
    end
    
  end
end
