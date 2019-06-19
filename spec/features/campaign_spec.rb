require "rails_helper"

RSpec.describe "Campaigns" do
  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user)
                                                      .and_return(user)
    visit dashboard_path
  end

  describe "Index Page" do
    it "Shows a link from the navbar" do
      within("nav") do
        click_link("Campaigns")
        expect(current_path).to eq(campaigns_path)
      end
    end

    it "shows all campaigns" do
      list = create_list(:campaign, 3)
      visit campaigns_path

      expect(page).to have_content(list[0].name)
      expect(page).to have_content(list[1].name)
      expect(page).to have_content(list[2].name)
    end

    it "links to all campaigns" do
      list = create_list(:campaign, 3)
      visit campaigns_path

      within("#campaign-#{list[0].id}") do
        click_on "Details"
      end
      expect(current_path).to eq(campaign_path(list[0]))
    end
  end

  describe "Show Page" do
    let(:campaign) { create(:campaign) }

    before(:each) do
      create_list(:message, 5, campaign: campaign)
    end

    it "Shows Campaign Information" do
      visit campaign_path(campaign)

      expect(page).to have_content(campaign.name)
      campaign.messages.each do |message|
        expect(page).to have_content(message.text)
        expect(page).to have_content(message.elapse_minutes)
      end
    end
  end

  describe "Adding a New Campaign" do
    it "Allows for dynamic addition of new message fields", js: true do
      visit new_campaign_path

      expect(page.all(".message-text-field").count).to eq(0)
      click_on "Add Message"
      expect(page.all(".message-text-field").count).to eq(1)
      click_on "Add Message"
      click_on "Add Message"
      expect(page.all(".message-text-field").count).to eq(3)
    end

    it "Allows for dynamic deletion of message fields", js: true do
      visit new_campaign_path

      click_on "Add Message"
      expect(page.all(".message-text-field").count).to eq(1)
      click_on "Remove"
      expect(page.all(".message-text-field").count).to eq(0)
    end

    it "Allows for creation of a new campaign", js: true do
      campaign = build(:campaign)
      messages = build_list(:message, 2)
      visit new_campaign_path
      click_on "Add Message"
      click_on "Add Message"

      message_box_1 = find(".nested-fields:nth-child(1)").find("textarea")
      elapse_time_box_1 = find(".nested-fields:nth-child(1)").find("input")
      message_box_2 = find(".nested-fields:nth-child(2)").find("textarea")
      elapse_time_box_2 = find(".nested-fields:nth-child(2)").find("input")

      fill_in :campaign_name, with: campaign.name
      message_box_1.fill_in with: messages[0].text
      elapse_time_box_1.fill_in with: messages[0].elapse_minutes
      message_box_2.fill_in with: messages[1].text
      elapse_time_box_2.fill_in with: messages[1].elapse_minutes

      click_on "Create Campaign"

      expect(Campaign.count).to eq(1)
      first = Campaign.first
      expect(first.name).to eq(campaign.name)
      expect(first.messages.length).to eq(2)
      expect(first.messages[0].text).to eq(messages[0].text)
      expect(first.messages[0].elapse_minutes).to eq(messages[0].elapse_minutes)
      expect(first.messages[1].text).to eq(messages[1].text)
      expect(first.messages[1].elapse_minutes).to eq(messages[1].elapse_minutes)
    end
  end
end
