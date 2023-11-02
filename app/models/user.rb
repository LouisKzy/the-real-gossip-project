class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, 
  length: { minimum: 6, maximum: 50 }
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "You need an email address to proceed. It's mandatory." }

  belongs_to :city
  has_many :gossips
end