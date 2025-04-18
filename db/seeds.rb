10.times do
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    password_confirmation: "password"
  )
end

user_ids = User.ids

20.times do |index|
  user = User.find(user_ids.sample)

  # 投稿を一旦 new する（保存しない）
  post = user.posts.new(title: "タイトル#{index}", body: "本文#{index}")

  # ファイル添付
  file_path = Rails.root.join("app/assets/images/sample.jpg")
  rand(1..8).times do
    file = File.open(file_path)
    post.images.attach(io: file, filename: "sample.jpg", content_type: "image/jpeg")
  end

  # バリデーション付きで保存
  post.save!
end
