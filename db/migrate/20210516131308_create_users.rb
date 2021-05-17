class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :role, default: 0, null: false
      t.string :email, null: false
      t.string :password_digest
      t.timestamps

      t.index :email, unique: true
    end
  end
end
