module SelecaoAdmin
  class Lecture < ActiveRecord::Base
    attr_accessible :title, :video_url, :online_lecture_codes_attributes, :lecture_type_id, :lecture_date, :lecture_time, :max_capacity, :location, :campus_id, :announcement_ids, :enrollment_id 
    belongs_to :lecture_type
    
    belongs_to :campus
    belongs_to :enrollment
    
    has_many :lecture_announcements, :dependent => :destroy
    has_many :announcements, :through => :lecture_announcements
    
    has_many :online_lecture_codes, :inverse_of => :lecture, :dependent => :destroy
    accepts_nested_attributes_for :online_lecture_codes, :allow_destroy => true

    has_many :lecture_presences, :dependent => :restrict
    has_many :enrolleds, :through => :lecture_presences

    validates_presence_of :announcement_ids, :if => "lecture_type_id == 1"    

    validates_presence_of :lecture_date, :if => "lecture_type_id == 1"    
    validates_presence_of :lecture_time, :if => "lecture_type_id == 1"    
    validates_presence_of :max_capacity, :if => "lecture_type_id == 1"    
    validates_presence_of :location, :if => "lecture_type_id == 1"    
    validates_presence_of :campus_id, :if => "lecture_type_id == 1"    

    validates_presence_of :enrollment_id, :if => "lecture_type_id == 2"    
    validates_presence_of :video_url, :if => "lecture_type_id == 2"    
    validates_presence_of :online_lecture_codes, :message => I18n.t("validation.lecture.blank_online_lecture_codes"), :if => "lecture_type_id == 2"
    
    def self.icon
      return 'icon-facetime-video'
    end           
    
    validates_presence_of :title, :lecture_type_id
    
    before_update :check_lecture_type
    
    def check_lecture_type
      if self.lecture_type_id == 1
        self.online_lecture_codes.destroy_all
        self.enrollment_id = nil
        self.video_url = nil
      elsif self.lecture_type_id == 2
        self.announcements.destroy_all
        self.lecture_date = nil
        self.lecture_time = nil
        self.max_capacity = nil
        self.location = nil
        self.campus_id = nil
      end
    end
  end
end
