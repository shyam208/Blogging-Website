class User < ApplicationRecord
  has_many :articles
  has_many :comments

 has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }, length: {maximum: 50}
  validates :password, length: {maximum: 20}
end
