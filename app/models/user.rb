class User < ApplicationRecord
  has_secure_password
  has_many :recipes

  validates :username, presence: true
  validates :password, presence: true


end
