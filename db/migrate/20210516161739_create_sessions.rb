class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :user, index: true
      t.text :token
      t.datetime :expires_at
      t.timestamps
    end
  end
end
