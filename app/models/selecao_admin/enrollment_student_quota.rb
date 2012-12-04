module SelecaoAdmin
  class EnrollmentStudentQuota < ActiveRecord::Base
    belongs_to :enrollment
    belongs_to :student_quota
    # attr_accessible :title, :body
  end
end
