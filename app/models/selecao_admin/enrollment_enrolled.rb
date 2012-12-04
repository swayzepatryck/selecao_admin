module SelecaoAdmin
  class EnrollmentEnrolled < ActiveRecord::Base
    belongs_to :enrolled
    belongs_to :enrollment
    belongs_to :student_quota
    belongs_to :score_evaluation

    attr_accessible :enrolled_id, :enrollment_id, :student_quota_id, :score_evaluation_id
  end
end
