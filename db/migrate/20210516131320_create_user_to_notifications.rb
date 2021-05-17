class CreateUserToNotifications < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :notifications
  end
end
