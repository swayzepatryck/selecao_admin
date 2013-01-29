module SelecaoAdmin
  class Enrollment < ActiveRecord::Base
    belongs_to :announcement
    belongs_to :course
    belongs_to :survey
    belongs_to :entry_process
    belongs_to :lecture_type
        
    attr_accessible :end_date, :end_time, :number_of_vacancies, :start_date, :start_time, :course_id, :announcement_id, :survey_id, :entry_process_id, :drawing, :score_evaluation_ids, :student_quota_ids, :lecture_type_id
    
    validates_presence_of :course_id, :survey_id, :entry_process_id, :start_date, :end_date, :start_time, :end_time, :number_of_vacancies
    
    validates_uniqueness_of :course_id, :scope => [:announcement_id]
    
    validates_presence_of :lecture_type_id
    validates_presence_of :student_quotas, :message => I18n.t("validation.entry_process.blank_student_quota")
    validates_presence_of :score_evaluations, :message => I18n.t("validation.entry_process.blank_score_evaluation"), :if => "entry_process.try(:entry_process_mode_id) and entry_process.entry_process_mode_id == 1"    
    
    has_many :enrollment_enrolleds, :dependent => :destroy
    has_many :enrolleds, :through => :enrollment_enrolleds, :dependent => :restrict
    
    has_many :enrollment_score_evaluations
    has_many :score_evaluations, :through => :enrollment_score_evaluations
    
    has_many :enrollment_student_quotas
    has_many :student_quotas, :through => :enrollment_student_quotas    
    
    validate :start_date_x_end_date
    
    has_one :drawing, :dependent => :destroy
    has_many :enrolled_scores
    
    before_update :check_entry_process_mode
    
    def count_enrollment_enrolleds
      self.enrolleds.count
    end
    
    def check_entry_process_mode
      if entry_process.entry_process_mode_id == 2
        self.score_evaluations.delete_all
      end
    end
            
    def start_date_x_end_date
      errors.add(:end_date, I18n.t("validation.enrollment.start_date_bigger_than_end_date")) unless start_date <= end_date      
    end
    
    def self.icon
      return 'icon-file'
    end         
    
    def short_title
      return "#{self.id} - #{self.announcement.title} - #{self.entry_process.name} - #{self.course.name} # #{self.start_date.strftime('%d/%m/%y')} à #{self.end_date.strftime('%d/%m/%y')}"
    end  
    
    before_destroy :remove_score_evaluations
    before_destroy :remove_student_quotas    
    
    def self.to_csv(se)
      CSV.generate do |csv|        
        all.each do |enrollment|
          csv << enrollment.enrollment_enrolleds.select {|ee| ee.score_evaluation_id == se.to_i}.map {|ee| ee.enrolled_id}.sort.map {|enrolled_id| User.find(SelecaoAdmin::Enrolled.find(enrolled_id).user_id).login.to_s}
        end
      end
    end  
    
    def self.import_scores(file, score_evaluation_id, enrollment_id)
      disciplines = ScoreEvaluation.find(score_evaluation_id).disciplines.order(:id)
      
      CSV.foreach(file.path, :headers => false) do |row| 
        i = 0
        row.first.split(';')[3..7].each do |score|
          enrolled = User.find_by_login(row.first.split(';')[1].to_s).enrolled

          enrolled_score = EnrolledScore.find_by_enrolled_id_and_discipline_id_and_enrollment_id(enrolled.id, disciplines[i].id, enrollment_id) || EnrolledScore.new
          enrolled_score.score = score
          enrolled_score.discipline_id = disciplines[i].id
          enrolled_score.enrolled_id = enrolled.id
          enrolled_score.enrollment_id = enrollment_id    
          enrolled_score.score_evaluation_id = score_evaluation_id       
          
          i = i + 1
          enrolled_score.save!            
        end          
      end
    end    

    private
    
    def remove_score_evaluations     
      self.score_evaluations.delete_all
    end

    def remove_student_quotas     
      self.student_quotas.delete_all
    end  
    
    
  end
end
