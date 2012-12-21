module SelecaoAdmin
  class EnrolledScore < ActiveRecord::Base
    belongs_to :enrolled
    belongs_to :discipline
    belongs_to :enrollment
    belongs_to :score_evaluation
    attr_accessible :score, :enrolled_id, :discipline_id, :enrollment_id, :score_evaluation_id
  end
end
