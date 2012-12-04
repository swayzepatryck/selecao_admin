module SelecaoAdmin
  class ScoreEvaluationDiscipline < ActiveRecord::Base
    belongs_to :score_evaluation
    belongs_to :discipline
    # attr_accessible :title, :body
  end
end
