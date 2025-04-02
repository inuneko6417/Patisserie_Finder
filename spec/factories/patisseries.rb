FactoryBot.define do
  factory :patisseries do
    name { "MyString" }
    address { "MyString" }
    nearest_station { "MyString" }
    eat_in { false }
    takeout { false }
    business_hours { "MyString" }
    closed_on { "MyString" }
    phone_number { "MyString" }
    web_and_sns { "MyString" }
    latitude { "9.99" }
    longitude { "9.99" }
  end
end
