require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone_number) }
    it { should validate_uniqueness_of(:phone_number) }
  end

  describe 'Relationships' do
    it { should have_many(:campaign_contacts) }
    it { should have_many(:campaigns).through(:campaign_contacts) }
    it { should have_many(:contact_messages) }
    it { should have_many(:messages).through(:contact_messages) }
  end

  describe 'Instance Methods' do
    it '#add_campaigns' do
      contact = create(:contact)
      campaign_ids = create_list(:campaign_with_messages, 3).map(&:id)

      contact.add_campaigns(campaign_ids)
      expect(contact.campaigns.count).to eq(3)
      expect(contact.messages.count > 0).to be true
    end
  end
end
