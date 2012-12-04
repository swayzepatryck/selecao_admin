module SelecaoAdmin
  class CoursePrerequisite < ActiveRecord::Base
    belongs_to :course, :inverse_of => :course_prerequisites
    attr_accessible :description, :title
    
    validates_presence_of :title
  end
end
