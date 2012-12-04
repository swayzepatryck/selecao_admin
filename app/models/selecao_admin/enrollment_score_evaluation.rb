module SelecaoAdmin
  class EnrollmentScoreEvaluation < ActiveRecord::Base
    belongs_to :enrollment
    belongs_to :score_evaluation
    # attr_accessible :title, :body
  end
end
