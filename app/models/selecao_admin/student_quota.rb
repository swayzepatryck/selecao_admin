module SelecaoAdmin
  class StudentQuota < ActiveRecord::Base
    attr_accessible :abbreviation, :title, :drawing_ids, :active
    
    has_many :enrollment_student_quotas, :dependent => :destroy
    has_many :enrollments, :through => :enrollment_student_quotas, :dependent => :restrict
    
    has_many :enrollment_enrolleds, :dependent => :restrict
    
    has_many :drawing_student_quotas
    has_many :drawings, :through => :drawing_student_quotas, :dependent => :restrict
    #accepts_nested_attributes_for :drawings, :allow_destroy => true
        
    validates_presence_of :abbreviation, :title
    validates_uniqueness_of :title    
    
    def self.icon
      return 'icon-tags'
    end    
    
    def short_title
      "(#{self.abbreviation}) - #{self.title}"
    end
    
    def active_and_name
      "#{self.active_title} - #{self.abbreviation} - #{self.title}"
    end
    
    def active_title
      if active
        return 'Ativado'
      else
        return 'Desativado'
      end
    end
    
  end
end
