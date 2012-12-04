module SelecaoAdmin
  class Lecture < ActiveRecord::Base
    attr_accessible :title, :video_url, :online_lecture_codes_attributes, :lecture_type_id, :lecture_date, :lecture_time, :max_capacity, :location, :campus_id, :announcement_id
    belongs_to :lecture_type
    belongs_to :announcement
    belongs_to :campus
    
    has_many :online_lecture_codes, :inverse_of => :lecture, :dependent => :destroy
    accepts_nested_attributes_for :online_lecture_codes, :allow_destroy => true

    has_many :lecture_presences
    has_many :enrolleds, :through => :lecture_presences

    validates_presence_of :video_url, :if => "lecture_type_id == 2"    
    validates_presence_of :online_lecture_codes, :message => I18n.t("validation.lecture.blank_online_lecture_codes"), :if => "lecture_type_id == 2"
    
    def self.icon
      return 'icon-facetime-video'
    end           
    
    validates_presence_of :title, :lecture_type_id, :announcement_id, :campus_id
    #validates_uniqueness_of :title, :video_url
  end
end
