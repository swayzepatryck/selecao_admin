module SelecaoAdmin
  class Publication < ActiveRecord::Base
    belongs_to :publication_category
    attr_accessible :publication_text, :title, :publication_category_id
    
    validates_presence_of :publication_text, :title, :publication_category_id
    
    def self.icon
      return 'icon-facetime-video'
    end           
    
  end
end
