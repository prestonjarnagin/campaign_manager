require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  it 'shows website title' do
    visit '/'

    expect(page).to have_content('Mango')
  end

  it 'shows login boxes' do
    visit '/'

    expect(page).to have_field("email", placeholder: "Email")
    expect(page).to have_field("password", placeholder: "Password")
  end
end
