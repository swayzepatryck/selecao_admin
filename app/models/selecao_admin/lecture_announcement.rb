module SelecaoAdmin
  class LectureAnnouncement < ActiveRecord::Base
    belongs_to :lecture
    belongs_to :announcement
    # attr_accessible :title, :body
  end
end
