require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:text)}
    it {should validate_presence_of(:elapse_minutes)}
  end

  describe 'Relationships' do
    it {should belong_to(:campaign)}
    it { should have_many(:contact_messages) }
    it { should have_many(:contacts).through(:contact_messages) }

  end
end
