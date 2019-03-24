class Message < ApplicationRecord
    validates_presence_of :text, :elapse_minutes
    belongs_to :campaign
end
