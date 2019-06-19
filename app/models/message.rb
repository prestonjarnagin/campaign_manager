class Message < ApplicationRecord
  validates_presence_of :text, :elapse_minutes
  belongs_to :campaign

  has_many :contact_messages
  has_many :contacts, through: :contact_messages
end
