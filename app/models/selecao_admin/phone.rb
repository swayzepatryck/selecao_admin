module SelecaoAdmin
  class Phone < ActiveRecord::Base
    belongs_to :phone_type
    belongs_to :resource, :polymorphic => true, :inverse_of => :resources 
    attr_accessible :prefix, :resource_id, :resource_type, :suffix, :phone_type_id
    
    validates_presence_of :phone_type_id, :prefix, :suffix
    validates_uniqueness_of :suffix, :scope => [:resource_type, :resource_id, :prefix]
    
    def short_phone
       return "#{self.phone_type.title} - (#{self.prefix}) #{self.suffix}"
     end
    
  end
end
