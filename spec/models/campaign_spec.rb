require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'Relationships' do
    it {should have_many(:messages)}
    it {should accept_nested_attributes_for(:messages)}

    it { should have_many(:campaign_contacts) }
    it { should have_many(:contacts).through(:campaign_contacts) }
  end
end
