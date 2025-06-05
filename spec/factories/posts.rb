FactoryBot.define do
  factory :post do
    title { "テスト投稿" }
    body { "これはテスト投稿の本文です。" }
    association :user
  end
end
