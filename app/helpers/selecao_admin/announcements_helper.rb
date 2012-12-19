module SelecaoAdmin
  module AnnouncementsHelper
    def get_previous_show_announcement_uri(announcement)
      request.referrer[request.referrer.size-announcement_path(announcement.id).size,announcement_path(announcement.id).size] 
    end
  end
end
