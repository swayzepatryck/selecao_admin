module SelecaoAdmin
  class AttendanceLecturePresenceStatus < ActiveRecord::Base
    attr_accessible :title
    has_many :lecture_presences
  end
end
