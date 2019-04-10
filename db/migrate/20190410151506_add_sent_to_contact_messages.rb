class AddSentToContactMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_messages, :sent, :boolean
  end
end
