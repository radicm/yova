class Portfolio < ApplicationRecord
  has_and_belongs_to_many :companies
  belongs_to :user
end
