module SelecaoAdmin
  class Drawing < ActiveRecord::Base
    belongs_to :enrollment
    belongs_to :employee, :class_name => 'User', :foreign_key => 'employee_id'
    
    attr_accessible :publication_date, :publication_time, :employee_id, :enrollment_id, :drawing_student_quotas_attributes, :raffle_date, :raffle_time #:student_quotas_attributes
    
    has_many :drawing_enrolleds
    has_many :enrolleds, :through => :drawing_enrolleds, :order => 'selecao_admin_drawing_enrolleds.id'
    
    has_many :drawing_student_quotas
    has_many :student_quotas, :through => :drawing_student_quotas
    accepts_nested_attributes_for :drawing_student_quotas
    
    validates_presence_of :publication_date, :publication_time, :employee_id, :enrollment_id
    validates_uniqueness_of :enrollment_id
    
    validate :check_number_of_vacancies
    
    def drawing_avaiable_enrolleds
      dae = Array.new
      self.drawing_student_quotas.each do |deq|
        nr_inscritos = self.enrollment.enrollment_enrolleds.where(:student_quota_id => deq.student_quota_id).count 
        nr_vagas =  self.drawing_student_quotas.where(:student_quota_id => deq.student_quota_id).first.number_of_vacancies

        if nr_inscritos > nr_vagas
          dae << deq.student_quota
        end              
      end 
      dae
    end
    
    def check_number_of_vacancies
      drawing_student_quotas.each do |deq|
        if !deq.number_of_vacancies
          errors.add(:blank_number_of_vacancies, I18n.t("validation.drawing_student_quota.blank_number_of_vacancies")) 
          break
        end
      end
    end 
      
    def self.icon
      return 'icon-random'
    end         
  end
end
