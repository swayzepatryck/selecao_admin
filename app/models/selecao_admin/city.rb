module SelecaoAdmin
  class City < ActiveRecord::Base
    belongs_to :state
    attr_accessible :name
    
    validates_presence_of :name
    validates_uniqueness_of :name
    
    def name_with_state
      "#{self.name} - #{self.state.code}"
    end
  end
end
