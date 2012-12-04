module SelecaoAdmin
  class State < ActiveRecord::Base
    attr_accessible :code, :name
    has_many :cities
    
    validates_presence_of :code, :name
    validates_uniqueness_of :code    
  end
end
