require 'rails_helper'

RSpec.describe 'Contacts' do
  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user)
    .and_return(user)
    visit dashboard_path
  end
  it 'shows a link from the navbar' do
    within('nav') do
      click_link('Contacts')
      expect(current_path).to eq(contacts_path)
    end
  end
  describe 'Adding' do
    it 'show link to add new contact' do
      click_link('Contacts')
      click_link('Add New Contact')
      expect(current_path).to eq new_contact_path
    end
  end
end
