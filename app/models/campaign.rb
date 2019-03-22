class Campaign < ApplicationRecord
  validates_presence_of :name
  has_many :messages, dependent: :destroy
  accepts_nested_attributes_for :messages, allow_destroy: true, reject_if: proc { |a| a[:text].blank? }
end
