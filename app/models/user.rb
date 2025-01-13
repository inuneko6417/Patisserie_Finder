class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
end
