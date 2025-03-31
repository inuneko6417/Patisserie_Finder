class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images

  validates :title, presence: true, length: { maximum: 255 }
  validates :body, presence: true, length: { maximum: 1000 }
  validate :validate_images_count
  validate :validate_image_type

  scope :recent, -> { order(created_at: :desc) }
  scope :by_comments_count, -> { left_joins(:comments).group(:id).order("COUNT(comments.id) DESC") }

  private

  def validate_images_count
    if images.attached? && images.count > 8
      errors.add(:images, "は8枚までアップロードできます")
    elsif images.blank?
      errors.add(:images, "は1枚以上アップロードしてください")
    end
  end

  def validate_image_type
    return unless images.attached?

    images.each do |image|
      unless image.content_type.in?(%w[image/jpeg image/png image/gif])
        errors.add(:images, "はJPEG, PNG, GIFのみアップロード可能です")
      end
    end
  end
end
