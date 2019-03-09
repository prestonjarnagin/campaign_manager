require 'rails_helper'

RSpec.feature "Logins", type: :feature do
  it 'shows website title' do
    visit '/'

    expect(page).to have_content('Mango')
  end

  it 'allows existing user to login' do
    user = create(:user)
    visit '/'
    fill_in :session_email, with: user.email
    fill_in :session_password, with: user.password

    click_button 'Login'

    expect(current_path).to eq(dashboard_path)
  end

  it 'handles empty input' do
    user = create(:user)
    visit '/'
    fill_in :session_email, with: ""
    fill_in :session_password, with: ""

    click_button 'Login'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Error")
  end

  it 'handles empty email' do
    user = create(:user)
    visit '/'
    fill_in :session_email, with: ""
    fill_in :session_password, with: user.password

    click_button 'Login'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Error")
  end

  it 'handles empty password' do
    user = create(:user)
    visit '/'
    fill_in :session_email, with: user.email
    fill_in :session_password, with: ""

    click_button 'Login'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Error")
  end

  it 'handles incorrect password' do
    user = create(:user)
    visit '/'
    fill_in :session_email, with: user.email
    fill_in :session_password, with: "a#{user.password}"

    click_button 'Login'

    expect(current_path).to eq(login_path)
    expect(page).to have_content("Error")
  end
end
