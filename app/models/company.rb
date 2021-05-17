class Company < ApplicationRecord
  has_and_belongs_to_many :portfolios
  has_many :stock_data, dependent: :destroy
end
