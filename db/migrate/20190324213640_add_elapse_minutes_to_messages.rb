class AddElapseMinutesToMessages < ActiveRecord::Migration[5.1]
  def change
    change_table :messages do |t|
      t.float :elapse_minutes
    end
  end
end
