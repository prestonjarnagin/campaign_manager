require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:text)}
  end

  describe 'Relationships' do
    it {should belong_to(:campaign)}
  end
end
