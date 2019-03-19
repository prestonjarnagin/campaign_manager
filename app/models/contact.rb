class Contact < ApplicationRecord

  validates_presence_of :name
  validates :phone_number, uniqueness: true, presence: true


end
