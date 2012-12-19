module SelecaoAdmin
  class LecturePresence < ActiveRecord::Base
    belongs_to :lecture
    belongs_to :enrolled, :foreign_key => :user
    belongs_to :attendance_lecture_presence_status
    # attr_accessible :title, :body
    
    def user
      User.find_by_login(self.enrolled_unique_id)
    end
  end
end
