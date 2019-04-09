class ContactMessage < ApplicationRecord
  validates_presence_of :send_time
  belongs_to :message
  belongs_to :contact
end
