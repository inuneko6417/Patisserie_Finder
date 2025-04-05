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

Patisserie.create!([
  { name: "パティスリーA", description: "人気No.1のケーキショップ", address: "神奈川県横浜市中区", nearest_station: "横浜駅", eat_in: true, takeout: true, business_hours: "10:00〜20:00", closed_on: "水曜日", phone_number: "045-123-4567", web_and_sns: "https://example.com" },
  { name: "パティスリーB", description: "新鮮なフルーツを使用", address: "神奈川県川崎市", nearest_station: "川崎駅", eat_in: true, takeout: false, business_hours: "9:00〜19:00", closed_on: "月曜日", phone_number: "044-987-6543", web_and_sns: "https://example.com" },
  { name: "パティスリーC", description: "地元で愛されるケーキ", address: "神奈川県藤沢市", nearest_station: "藤沢駅", eat_in: false, takeout: true, business_hours: "11:00〜21:00", closed_on: "火曜日", phone_number: "0466-111-2222", web_and_sns: "https://example.com" },
  { name: "パティスリーD", description: "特製スイーツが人気", address: "神奈川県厚木市", nearest_station: "本厚木駅", eat_in: true, takeout: true, business_hours: "10:30〜20:30", closed_on: "木曜日", phone_number: "046-333-4444", web_and_sns: "https://example.com" },
  { name: "パティスリーE", description: "チョコレートケーキが絶品", address: "神奈川県相模原市", nearest_station: "相模大野駅", eat_in: false, takeout: true, business_hours: "9:30〜18:30", closed_on: "金曜日", phone_number: "042-555-6666", web_and_sns: "https://example.com" },
  { name: "パティスリーF", description: "アットホームな雰囲気", address: "神奈川県横須賀市", nearest_station: "横須賀中央駅", eat_in: true, takeout: false, business_hours: "10:00〜22:00", closed_on: "土曜日", phone_number: "046-777-8888", web_and_sns: "https://example.com" },
  { name: "パティスリーG", description: "職人技が光るケーキ", address: "神奈川県鎌倉市", nearest_station: "鎌倉駅", eat_in: true, takeout: true, business_hours: "8:00〜17:00", closed_on: "日曜日", phone_number: "0467-999-0000", web_and_sns: "https://example.com" },
  { name: "パティスリーH", description: "絶妙な甘さが特徴", address: "神奈川県小田原市", nearest_station: "小田原駅", eat_in: false, takeout: true, business_hours: "9:00〜20:00", closed_on: "なし", phone_number: "0465-121-2323", web_and_sns: "https://example.com" },
  { name: "パティスリーI", description: "美しいデザインケーキ", address: "神奈川県平塚市", nearest_station: "平塚駅", eat_in: true, takeout: true, business_hours: "10:00〜19:00", closed_on: "なし", phone_number: "0463-343-4545", web_and_sns: "https://example.com" }
])
