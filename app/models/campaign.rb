class Campaign < ApplicationRecord
  validates_presence_of :name
  has_many :messages, dependent: :destroy
  has_many :campaign_contacts
  has_many :contacts, through: :campaign_contacts
  accepts_nested_attributes_for :messages, reject_if: lambda { |a| a[:text].blank? }
end
