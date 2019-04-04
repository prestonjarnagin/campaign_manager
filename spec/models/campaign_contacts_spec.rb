require 'rails_helper'

RSpec.describe CampaignContact, type: :model do
  describe 'Relationships' do

    it { should belong_to(:contact) }
    it { should belong_to(:campaign) }
  end
end
