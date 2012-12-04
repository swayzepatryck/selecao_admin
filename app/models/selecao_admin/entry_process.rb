module SelecaoAdmin
  class EntryProcess < ActiveRecord::Base
    belongs_to :entry_process_mode
    attr_accessible :name, :entry_process_mode_id, :online_lecture_id
    
    # :dependent => :restrict nao deixa excluir enquanto houver dependencia
    has_many :enrollments, :dependent => :restrict 
    
    def self.icon
      return 'icon-tags'
    end               
    
    validates_presence_of :name, :entry_process_mode_id    
    validates_uniqueness_of :name
    
  end
end
