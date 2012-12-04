module SelecaoAdmin
  class CourseSituation < ActiveRecord::Base
    attr_accessible :title
    
    validates_presence_of :title
    validates_uniqueness_of :title
  end
end
