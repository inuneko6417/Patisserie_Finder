class User < ApplicationRecord
  mount_uploader :profile, ProfileUploader
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  def own?(object)
    id == object&.user_id
  end
end
