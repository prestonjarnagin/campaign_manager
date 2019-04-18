require 'rails_helper'

RSpec.describe 'Contacts' do
  let(:contact) { attributes_for(:contact) }

  before(:each) do
    user = create(:user)
    allow_any_instance_of(ApplicationController)
    .to receive(:current_user)
    .and_return(user)
  end

  it 'shows a link from the navbar' do
    visit dashboard_path
    within('nav') do
      click_link('Contacts')
      expect(current_path).to eq(contacts_path)
    end
  end

  it 'shows all contacts on the index page' do
    contacts = create_list(:contact, 6)
    visit contacts_path
    contacts.each do |contact|
      expect(page).to have_content(contact.name)
      expect(page).to have_content(contact.internal_name)
      expect(page).to have_content(contact.phone_number)
    end
  end

  describe 'Contact creation form' do

    it 'is accessible from the navbar' do
      visit contacts_path
      click_link('New Contact')
      expect(current_path).to eq new_contact_path
    end

    describe 'allows for' do
      it 'sucessful creation of new contact' do
        visit new_contact_path
        fill_in_contact_form(contact)
        click_on 'Create Contact'

        expect(current_path).to eq(contacts_path)
        expect(Contact.count).to eq(1)
      end

      it 'adding to campaigns at time of creation' do
        campaign_1 = create(:campaign)
        campaign_2 = create(:campaign)
        visit new_contact_path

        fill_in_contact_form(contact)
        find(:css, "#campaign-#{campaign_1.id}").set(true)
        find(:css, "#campaign-#{campaign_2.id}").set(true)
        click_on 'Create Contact'

        subject = Contact.first
        expect(subject.campaigns.count).to eq(2)
      end
    end

    describe 'doesnt save a new contact if missing...' do

      before(:each) { visit new_contact_path }

      it 'name' do
        fill_in :contact_internal_name, with: contact[:internal_name]
        fill_in :contact_phone_number, with: contact[:phone_number]
        click_on 'Create Contact'

        expect(current_path).to eq(new_contact_path)
        expect(page).to have_content('Error')
        expect(Contact.count).to eq(0)
      end

      it 'phone number' do
        fill_in :contact_name, with: contact[:name]
        fill_in :contact_internal_name, with: contact[:internal_name]
        click_on 'Create Contact'

        expect(current_path).to eq(new_contact_path)
        expect(page).to have_content('Error')
        expect(Contact.count).to eq(0)
      end
    end
  end
  describe 'Contact editing' do
    it 'is accessible from the contact show page' do
      contact = create(:contact)
      visit contact_path(contact)

      click_link('Edit Contact')

      expect(current_path).to eq edit_contact_path(contact)
    end
  end
end

def fill_in_contact_form(contact)
  fill_in :contact_name, with: contact[:name]
  fill_in :contact_internal_name, with: contact[:internal_name]
  fill_in :contact_phone_number, with: contact[:phone_number]
end
