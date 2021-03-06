module SelecaoAdmin
  class Announcement < ActiveRecord::Base
    attr_accessible :publication_date, :title, :another_controller, :announcement_file
    has_attached_file :announcement_file, :styles => { :medium => "300x300>", :thumb => "100x100>" }
    
    validates_presence_of :publication_date, :title
    validates_uniqueness_of :title
    
    # variável de controle para outras controllers que usam as actions de announcement. necessária para definir ação do javascript create.js
    attr_accessor :another_controller
    
    has_many :enrollments, :dependent => :restrict
    
    def self.icon
      return 'icon-file'
    end           
    
  end
end
