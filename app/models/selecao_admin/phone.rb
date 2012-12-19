module SelecaoAdmin
  class Phone < ActiveRecord::Base
    belongs_to :phone_type
    belongs_to :resource, :polymorphic => true, :inverse_of => :resources 
    attr_accessible :prefix, :resource_id, :resource_type, :suffix, :phone_type_id, :description
    
    validates_presence_of :phone_type_id, :prefix, :suffix, :description
    validates_uniqueness_of :suffix, :scope => [:resource_type, :resource_id, :prefix]
    
    validates_length_of :prefix, :in => 2..2
    validates_length_of :suffix, :in => 8..8
    
    def short_phone
       return "[#{self.phone_type.title}] #{self.description} - (#{self.prefix}) #{self.suffix}"
     end
    
  end
end
