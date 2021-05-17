class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.references :user, index: true
      t.float :investmented
      t.timestamps
    end
  end
end
