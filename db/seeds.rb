10.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.unique.email,
              password: "password",
              password_confirmation: "password")
end

user_ids = User.ids

20.times do |index|
  user = User.find(user_ids.sample)
  post = user.posts.create!(title: "タイトル#{index}", body: "本文#{index}")

  rand(1..8).times do
    file_path = Rails.root.join("app/assets/images/sample.jpg") # ローカル画像のパス
    file = File.open(file_path) # 画像を開く
    post.images.attach(io: file, filename: "sample.jpg", content_type: "image/jpeg") # Active Storage で保存
  end
end
