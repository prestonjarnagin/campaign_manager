class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :text
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
