class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.datetime :seen_at
      t.text :content, null: false
      t.timestamps
    end
  end
end
