module SelecaoAdmin
  class OnlineLectureCode < ActiveRecord::Base
    belongs_to :lecture, :inverse_of => :online_lecture_codes
    attr_accessible :code, :code_sequence
    
    validates_presence_of :code_sequence, :code
    validates_uniqueness_of :code
    
    default_scope order('code_sequence')    
  end
end
