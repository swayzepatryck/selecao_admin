module SelecaoAdmin
  class EnrolledScore < ActiveRecord::Base
    belongs_to :enrolled
    belongs_to :discipline
    attr_accessible :score, :enrolled_id, :discipline_id
  end
end
