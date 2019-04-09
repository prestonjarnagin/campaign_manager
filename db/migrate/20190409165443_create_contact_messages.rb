class CreateContactMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_messages do |t|
      t.references :contact, foreign_key: true
      t.references :message, foreign_key: true
      t.datetime :send_time
      t.timestamps
    end
  end
end
