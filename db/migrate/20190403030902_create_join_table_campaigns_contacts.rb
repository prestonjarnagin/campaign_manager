class CreateJoinTableCampaignsContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_contacts do |t|
      t.references :campaign, foreign_key: true
      t.references :contact, foreign_key: true
    end
  end
end
