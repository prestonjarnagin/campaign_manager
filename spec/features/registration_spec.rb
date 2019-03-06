require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  it 'is accessible from the root' do
    visit '/'

    click_link 'Create Account'
    expect(current_path).to eq(new_user_path)
  end

end
