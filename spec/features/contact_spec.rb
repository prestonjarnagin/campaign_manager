require 'rails_helper'

RSpec.describe 'Contacts' do
  describe 'Adding' do
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
  end
end
