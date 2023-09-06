class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  has_many :timer, dependent: :destroy
  has_secure_password

  validates :name, :type, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message:"Invalid email id!!!!" }
end
