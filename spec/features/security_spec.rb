require 'rails_helper'

RSpec.describe 'Security' do
  describe 'Non-users cannot access' do
    it '/dashboard' do
      visit '/dashboard'
      expect(page.status_code).to eq(404)
    end

    describe '/users' do
      it '/new' do
        visit '/users/new'
        expect(page.status_code).to eq(404)
      end
    end

    describe '/contacts' do
      it '/' do
        visit '/contacts'
        expect(page.status_code).to eq(404)
      end

      it '/new' do
        visit '/contacts/new'
        expect(page.status_code).to eq(404)
      end
    end

    describe '/campaigns' do
      let(:campaign) { create(:campaign) }
      it '/' do
        visit '/campaigns'
        expect(page.status_code).to eq(404)
      end

      it '/new' do
        visit '/campaigns/new'
        expect(page.status_code).to eq(404)
      end

      it '/:id' do
        visit "/campaigns/#{campaign.id}"
        expect(page.status_code).to eq(404)
      end
    end
  end
end
