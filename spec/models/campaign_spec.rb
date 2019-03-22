require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe 'Validations' do
    it {should validate_presence_of(:name)}
  end

  describe 'Relationships' do
    it {should have_many(:messages)}
    it {should accept_nested_attributes_for(:messages)}
  end
end
