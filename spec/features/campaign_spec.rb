require 'rails_helper'

RSpec.describe 'Campagins' do
  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user)
    .and_return(user)
    visit dashboard_path
  end

  describe 'Adding a new campagin' do
    it 'Shows a link from the navbar' do
      within('nav') do
        click_link('Campaigns')
        expect(current_path).to eq(campaigns_path)
      end
    end

    it 'Allows for creation of a new campagin' do
      visit new_campaign_path
      campaign = attributes_for(:campaign)

      fill_in :campaign_name, with: campaign[:name]
      save_and_open_page
      click_on 'Create Campaign'

    end
  end
end
