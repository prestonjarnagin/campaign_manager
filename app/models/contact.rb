class Contact < ApplicationRecord

  validates_presence_of :name
  validates :phone_number, uniqueness: true, presence: true

  has_many :campaign_contacts
  has_many :campaigns, through: :campaign_contacts

  has_many :contact_messages
  has_many :messages, through: :contact_messages

  def add_campaigns(campaign_ids)
    # Associate campagins with this contact
    campaign_ids.each do |id|
      self.campaigns << Campaign.find(id)
    end

    # Associate messages with this contact on contact_messages with datetimes
    self.campaigns.each do |campaign|
      time = Time.now
      campaign.messages.each do |message|
        send_time = time + message.elapse_minutes.minutes
        ContactMessage
          .create!(message: message, contact: self, send_time: send_time)
      end
    end
  end
end
