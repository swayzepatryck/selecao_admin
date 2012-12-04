module SelecaoAdmin
  class DrawingEnrolled < ActiveRecord::Base
    belongs_to :drawing
    belongs_to :enrolled
    # attr_accessible :title, :body
  end
end
