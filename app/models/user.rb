class User < ApplicationRecord
  enum role: { customer: 0, admin: 1 }

  has_secure_password

  has_and_belongs_to_many :notifications
  has_many :sessions, dependent: :destroy
  has_one :portfolio, dependent: :destroy

  validates :email, uniqueness: true
end
