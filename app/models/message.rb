class Message < ApplicationRecord
    validates_presence_of :text
    belongs_to :campaign
end
