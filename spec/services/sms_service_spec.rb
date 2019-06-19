require 'rails_helper'

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

    describe '::parse_message' do
      it 'works as intended' do
        message = create(:message, text: "Hello <name>")
        contact_message = create(:contact_message,message: message, sent: false)
        actual = SMSService.parse_message(contact_message.id)

        expect(actual).to eq("Hello #{contact_message.contact.name}")
      end

      it 'doesnt break with convoluted brackets' do
        message = create(:message, text: "Hello <<>><><><<name>")
        contact_message = create(:contact_message,message: message, sent: false)
        actual = SMSService.parse_message(contact_message.id)

        expect(actual).to eq("Hello <<>><><><#{contact_message.contact.name}")
      end

      it 'doenst break with invalid brackets' do
        message = create(:message, text: "Hello >>name<<")
        contact_message = create(:contact_message,message: message, sent: false)
        actual = SMSService.parse_message(contact_message.id)

        expect(actual).to eq("Hello >>name<<")
      end
    end
  end
end
