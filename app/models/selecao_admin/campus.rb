module SelecaoAdmin
  class Campus < ActiveRecord::Base
    attr_accessible :name, :another_controller, :addresses_attributes, :phones_attributes
    attr_accessor :another_controller    
    validates_presence_of :name    
    validates_uniqueness_of :name
    
    def self.icon
      return 'icon-home'
    end        
    
    has_many :courses, :dependent => :restrict 
    
    has_many :addresses, :source => :resource, :source_type => 'SelecaoAdmin::Campus', :as => 'resource', :inverse_of => :resource
    accepts_nested_attributes_for :addresses, :allow_destroy => true 
    validates_presence_of :addresses
    
    has_many :phones, :source => :resource, :source_type => 'SelecaoAdmin::Campus', :as => 'resource', :inverse_of => :resource
    accepts_nested_attributes_for :phones, :allow_destroy => true  
    validates_presence_of :phones         
  end
end
