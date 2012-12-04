module SelecaoAdmin
  class EntryMailType < ActiveRecord::Base
    attr_accessible :mail_text, :title
    validates_uniqueness_of :title
  end
end
