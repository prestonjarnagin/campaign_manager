require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:phone_number)}
    it {should validate_uniqueness_of(:phone_number)}

    it { should have_many(:campaign_contacts) }
    it { should have_many(:campaigns).through(:campaign_contacts) }
  end
end
