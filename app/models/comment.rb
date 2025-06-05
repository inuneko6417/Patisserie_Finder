class Comment < ApplicationRecord
  validates :body, presence: true, length: { maximum: 1_535 }

  belongs_to :user
  belongs_to :post
end
