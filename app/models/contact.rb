class Contact < ApplicationRecord

  validates_presence_of :name
  validates :phone_number, uniqueness: true, presence: true

  has_many :campaign_contacts
  has_many :campaigns, through: :campaign_contacts

  def add_campaigns(campaign_ids)
    campaign_ids.each do |id|
      self.campaigns << Campaign.find(id)
    end
  end

end
