class ContactMessage < ApplicationRecord
  validates_presence_of :send_time
  validates_inclusion_of :sent, in: [true, false]
  belongs_to :message
  belongs_to :contact

  def self.message_queue
    ContactMessage
      .where('send_time < ?', [Time.now])
      .where(sent: false)
  end

end
