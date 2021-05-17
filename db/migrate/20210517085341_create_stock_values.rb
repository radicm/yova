class CreateStockValues < ActiveRecord::Migration[5.2]
  def change
    create_table :stock_values do |t|
      t.references :company, index: true
      t.float :value
      t.date :day
      t.timestamps
    end
  end
end
