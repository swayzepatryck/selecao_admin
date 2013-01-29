module SelecaoAdmin
  class EnrollmentEnrolled < ActiveRecord::Base
    belongs_to :enrolled
    belongs_to :enrollment
    belongs_to :student_quota
    belongs_to :score_evaluation

    attr_accessible :enrolled_id, :enrollment_id, :student_quota_id, :score_evaluation_id
    
    def number_of_quotas
      SelecaoAdmin::EnrollmentEnrolled.find_by_sql("select sq.title, count(*) from selecao_admin_enrollment_enrolleds ee, selecao_admin_student_quotas sq where ee.student_quota_id = sq.id group by sq.title order by count(*)")
    end
    
    
  end
end
