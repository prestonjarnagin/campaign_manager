require 'rails_helper'

RSpec.feature "Registrations", type: :feature do
  it 'is accessible from the root' do
    visit '/'

    click_link 'Create Account'
    expect(current_path).to eq(new_user_path)
  end

  it 'allows for new user signup' do
    visit new_user_path

    fill_in('user_email', :with => 'jane@doe.com')
    fill_in('user_password', :with => 'password1')
    fill_in('user_password_confirmation', :with => 'password1')
    fill_in('user_first_name', :with => 'Jane')
    fill_in('user_last_name', :with => 'Doe')
    click_button 'Create Account'

    expect(User.count).to eq(1)
    expect(current_path).to eq(dashboard_path)
  end
end
