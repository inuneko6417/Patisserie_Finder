class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :image_url_1
  has_one_attached :image_url_2
  has_one_attached :image_url_3

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 1000 }

  scope :recent, -> { order(created_at: :desc) }
end
