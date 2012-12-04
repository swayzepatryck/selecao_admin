module SelecaoAdmin
  class DrawingStudentQuota < ActiveRecord::Base
    belongs_to :drawing
    belongs_to :student_quota
    attr_accessible :number_of_vacancies, :student_quota_id, :drawing_id
  end
end
