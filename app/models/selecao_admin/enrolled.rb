module SelecaoAdmin
  class Enrolled < ActiveRecord::Base
    belongs_to :genre
    belongs_to :marital_status
    attr_accessible :birth_date, :fathers_name, :id_card_issuer, :id_card_number, :mothers_name, :user_id, :marital_status_id, :genre_id, :addresses_attributes, :phones_attributes, :user_name
    
    validates_uniqueness_of :id_card_number, :user_id
    
    has_many :enrolled_survey_answers
    has_many :survey_question_options, :through => :enrolled_survey_answers
    
    has_many :enrollment_enrolleds, :dependent => :destroy
    has_many :enrollments, :through => :enrollment_enrolleds
    
    has_many :enrolled_scores
    has_many :disciplines, :through => :enrolled_scores

    has_many :lecture_presences
    has_many :lectures, :through => :lecture_presences
    
    has_many :drawing_enrolleds
    has_many :enrollments, :through => :drawing_enrolleds    
    
    def self.icon
      return 'icon-user'
    end           
    
    has_many :addresses, :source => :resource, :source_type => 'SelecaoAdmin::Enrolled', :as => 'resource', :inverse_of => :resource
    accepts_nested_attributes_for :addresses, :allow_destroy => true 
    validates_presence_of :addresses
    
    has_many :phones, :source => :resource, :source_type => 'SelecaoAdmin::Enrolled', :as => 'resource', :inverse_of => :resource
    accepts_nested_attributes_for :phones, :allow_destroy => true  
    validates_presence_of :phones         
    
    validates_uniqueness_of :id_card_number
    validates_uniqueness_of :user_id, :message => I18n.t("validation.enrolled.existing_enrolled")
    validates_presence_of :id_card_number, :id_card_issuer, :mothers_name, :genre_id, :marital_status, :birth_date, :marital_status_id
    
    belongs_to :user            
  end
end
