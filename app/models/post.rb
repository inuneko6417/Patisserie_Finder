class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 1000 }

  scope :recent, -> { order(created_at: :desc) }
  scope :by_comments_count, -> { left_joins(:comments).group(:id).order('COUNT(comments.id) DESC') }
end
