class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.references :portfolio, index: true
      t.text :name
      t.timestamps
    end
  end
end
