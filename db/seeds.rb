10.times do
  User.create!(name: Faker::Name.name,
              email: Faker::Internet.unique.email,
              password: "password",
              password_confirmation: "password")
end

user_ids = User.ids

20.times do |index|
  user = User.find(user_ids.sample)
  user.posts.create!(title: "タイトル#{index}", body: "本文#{index}")
end
