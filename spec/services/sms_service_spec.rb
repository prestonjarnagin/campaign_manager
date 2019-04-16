require 'rails_helper'
require 'sidekiq/testing'

RSpec.describe SMSService do
  subject { SMSService }

  describe 'Class Methods' do
    it '::send_single_message' do
      VCR.use_cassette("twilio_send_message") do
        contact_message = create(:contact_message, sent: false)
        response = SMSService.send_single_message(contact_message.id)

        contact_message.reload
        expect(response.error_code).to eq(0)
        expect(contact_message.sent).to eq(true)
      end
    end
  end

  describe 'Instance Methods' do
    let (:message_list_length) { 3 }
    let (:subject) { SMSService.new(create_list(:contact_message, message_list_length, sent: false)) }
    it '#send' do
      Sidekiq::Testing.fake!

      expect{subject.send}.to change(SendSmsWorker.jobs, :size).by(message_list_length)
    end
  end

end
