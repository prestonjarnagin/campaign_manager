require 'rails_helper'

RSpec.describe ContactMessage, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:send_time) }
    it { should allow_value(true, false).for(:sent) }
  end

  describe 'Relationships' do
    it { should belong_to(:contact) }
    it { should belong_to(:message) }
  end

  describe 'Class Methods' do
    it '::message_queue' do
      message_to_send_1 = create(:contact_message, send_time: 10.minutes.ago, sent: false)
      message_to_send_2 = create(:contact_message, send_time: 15.minutes.ago, sent: false)
      create_list(:contact_message, 2, send_time: 10.minutes.ago, sent: true)

      result = ContactMessage.message_queue

      expect(result.count).to eq(2)
      expect(result).to include(message_to_send_1)
      expect(result).to include(message_to_send_2)
    end
  end
end
