require 'rails_helper'

RSpec.describe 'Campaigns' do
  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user)
    .and_return(user)
    visit dashboard_path
  end

  describe 'Adding a new campaign' do
    it 'Shows a link from the navbar' do
      within('nav') do
        click_link('Campaigns')
        expect(current_path).to eq(campaigns_path)
      end
    end

    it 'Allows for dynamic addition of new message fields', js: true do
      visit new_campaign_path

      expect(page.all('.message-text-field').count).to eq(0)
      click_on 'Add Message'
      expect(page.all('.message-text-field').count).to eq(1)
      click_on 'Add Message'
      click_on 'Add Message'
      expect(page.all('.message-text-field').count).to eq(3)
    end

    it 'Allows for dynamic deletion of message fields', js: true do
      visit new_campaign_path

      click_on 'Add Message'
      expect(page.all('.message-text-field').count).to eq(1)
      click_on 'Remove'
      expect(page.all('.message-text-field').count).to eq(0)
    end
    it 'Allows for creation of a new campaign', js: true do
      click_on 'Create Campaign'

    end
  end
end
