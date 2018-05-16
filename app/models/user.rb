class User < ApplicationRecord
  has_many :matches
  has_many :bots, through: :matches

  has_secure_password
end
