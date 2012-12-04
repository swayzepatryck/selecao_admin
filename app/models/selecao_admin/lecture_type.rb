module SelecaoAdmin
  class LectureType < ActiveRecord::Base
    attr_accessible :title
    has_many :lectures
  end
end
