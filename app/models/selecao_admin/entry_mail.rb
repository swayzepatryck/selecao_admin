module SelecaoAdmin
  class EntryMail < ActiveRecord::Base
    belongs_to :entry_mail_type
    attr_accessible :recipient_user_id, :sender_user_id
  end
end
