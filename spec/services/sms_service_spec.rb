require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe SMSService do
  subject { SMSService }
  describe 'Instance Methods' do
    let (:message_list_length) { 3 }
    let (:subject) { SMSService.new(create_list(:contact_message, message_list_length, sent: false)) }
    it '#send' do
      Sidekiq::Testing.fake!

      expect{subject.send}.to change(SendSmsWorker.jobs, :size).by(message_list_length)
    end
  end

end
