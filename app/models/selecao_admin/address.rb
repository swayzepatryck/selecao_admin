module SelecaoAdmin
  class Address < ActiveRecord::Base
    belongs_to :city
    belongs_to :address_type
    attr_accessible :complement, :neighborhood, :number, :postal_code, :resource_id, :resource_type, :street, :city_id, :address_type_id, :reference_point
    
    validates_presence_of :street, :address_type_id, :city_id, :postal_code
    
    belongs_to :resource, :polymorphic => true, :inverse_of => :resources
    
    validates_uniqueness_of :postal_code, :scope => [:resource_type, :resource_id]
    
    def short_address
      return "#{self.address_type.title} - #{self.street} #{self.number} #{self.complement} #{self.neighborhood} #{self.city.name} - #{self.city.state.name}"
    end
    
  end
end
