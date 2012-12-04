module SelecaoAdmin
  class Course < ActiveRecord::Base
     belongs_to :course_shift
    belongs_to :course_situation
    belongs_to :campus
    attr_accessible :description, :info_link, :name, :course_shift_id, :course_situation_id, :campus_id, :course_code, :course_prerequisites_attributes, :goal
    validates_presence_of :name, :course_shift_id, :course_situation_id, :campus_id, :info_link    
    
    has_many :course_prerequisites, :inverse_of => :course
    accepts_nested_attributes_for :course_prerequisites, :allow_destroy => true 
        
    validates_uniqueness_of :name, :course_code, :info_link
    has_many :enrollments, :dependent => :restrict
    
    attr_accessor :has_many_associations
    
    def self.icon
      return 'icon-book'
    end        
    
    def short_title
      "#{self.course_code} - #{self.name}"
    end
  end
end
