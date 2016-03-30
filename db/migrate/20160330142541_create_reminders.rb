class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.integer :trainno
      t.time :alarmtime
      t.integer :offset
      t.string :days
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
