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
    before(:each) do
      click_link('Contacts')
      click_link('Add New Contact')
    end

    it 'show link to add new contact' do
      expect(current_path).to eq new_contact_path
    end

    it 'allows for creation of new contact' do
      contact = attributes_for(:contact)

      fill_in :contact_name, with: contact[:name]
      fill_in :contact_internal_name, with: contact[:internal_name]
      fill_in :contact_phone_number, with: contact[:phone_number]
      click_on 'Create Contact'

      expect(current_path).to eq(contacts_path)
      expect(Contact.count).to eq(1)
    end

    describe 'doesnt save a new contact if missing...' do
      it 'name' do
        contact = attributes_for(:contact)

        fill_in :contact_internal_name, with: contact[:internal_name]
        fill_in :contact_phone_number, with: contact[:phone_number]
        click_on 'Create Contact'

        expect(current_path).to eq(new_contact_path)
        expect(page).to have_content('Error')
        expect(Contact.count).to eq(0)
      end

      it 'phone number' do
        contact = attributes_for(:contact)

        fill_in :contact_name, with: contact[:name]
        fill_in :contact_internal_name, with: contact[:internal_name]
        click_on 'Create Contact'

        expect(current_path).to eq(new_contact_path)
        expect(page).to have_content('Error')
        expect(Contact.count).to eq(0)
      end
    end
  end
end
