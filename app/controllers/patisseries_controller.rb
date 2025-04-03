class PatisseriesController < ApplicationController
  before_action :set_user
  def index
    @patisseries = [
      { id: 1, name: "ル･ミリュウ 鎌倉山", description: "人気No.1のケーキショップ"},
      { id: 2, name: "パティスリー アンカド（patisserie un cadeau）", description: "新鮮なフルーツを使用"},
      { id: 3, name: "パティスリーエスポワール", description: "地元で愛されるケーキ"},
      { id: 4, name: "パティスリー・ラ・ベルデュール", description: "特製スイーツが人気"},
      { id: 5, name: "パティスリーテンアンド", description: "チョコレートケーキが絶品"},
      { id: 6, name: "パティスリー サダハル アオキ パリ 丸の内店", description: "アットホームな雰囲気"},
      { id: 7, name: "パティスリーG", description: "職人技が光るケーキ"},
      { id: 8, name: "パティスリーH", description: "絶妙な甘さが特徴"},
      { id: 9, name: "パティスリーI", description: "美しいデザインケーキ"}
    ]
  end

  def show
    @patisseries = [
      { id: 1, name: "パティスリーA", description: "人気No.1のケーキショップ"},
      { id: 2, name: "パティスリーB", description: "新鮮なフルーツを使用"},
      { id: 3, name: "パティスリーC", description: "地元で愛されるケーキ"},
      { id: 4, name: "パティスリーD", description: "特製スイーツが人気"},
      { id: 5, name: "パティスリーE", description: "チョコレートケーキが絶品"},
      { id: 6, name: "パティスリーF", description: "アットホームな雰囲気",},
      { id: 7, name: "パティスリーG", description: "職人技が光るケーキ"},
      { id: 8, name: "パティスリーH", description: "絶妙な甘さが特徴"},
      { id: 9, name: "パティスリーI", description: "美しいデザインケーキ"}
    ]

  # サンプルデータ
  @patisserie = [
      { id: 1,
      name: "ル･ミリュウ 鎌倉山",
      address: "神奈川県鎌倉市鎌倉山３丁目２−３２",
      nearest_station: "藤沢駅",
      eat_in: true,
      takeout: true,
      business_hours: "9:00〜18:00",
      closed_on: "年中無休",
      phone_number: "0467-50-0226",
      web_and_sns: "https://lemilieu-kamakurayama.com/free/kamakuraya",
      comments: [
        { user: "いぬねこ", text: "おいしかったです！", time: "2023/01/15 16:50" },
        { user: "ねこいぬ", text: "季節限定がおすすめです！", time: "2023/01/15 16:55" }
        ]
      },
      { id: 2,
      name: "パティスリー アンカド（patisserie un cadeau）",
      address: "東京都町田市原町田３丁目６−１２",
      nearest_station: "町田駅",
      eat_in: true,
      takeout: true,
      business_hours: "11:00〜19:00",
      closed_on: "火曜日",
      phone_number: "050-5462-0484",
      web_and_sns: "https://uncadeau.info",
      comments: [
        { user: "いぬねこ", text: "おいしかったです！", time: "2023/01/15 16:50" },
        { user: "ねこいぬ", text: "季節限定がおすすめです！", time: "2023/01/15 16:55" }
        ]
      },
      { id: 3,
      name: "パティスリーエスポワール",
      address: "神奈川県厚木市旭町５丁目１８−３",
      nearest_station: "本厚木駅",
      eat_in: false,
      takeout: true,
      business_hours: "10:00〜18:00",
      closed_on: "水曜日",
      phone_number: "046-229-2117",
      web_and_sns: "https://patisserie-espoir.shop",
      comments: [
        { user: "いぬねこ", text: "おいしかったです！", time: "2023/01/15 16:50" },
        { user: "ねこいぬ", text: "季節限定がおすすめです！", time: "2023/01/15 16:55" }
        ]
      },
      { id: 4,
      name: "パティスリー・ラ・ベルデュール",
      address: "〒245-0002 神奈川県横浜市泉区緑園５丁目２９−２０",
      nearest_station: "緑園都市駅",
      eat_in: false,
      takeout: true,
      business_hours: "10:00〜19:00",
      closed_on: "月曜日",
      phone_number: "045-811-5123",
      web_and_sns: "https://www.verdure.co.jp/",
      comments: [
        { user: "いぬねこ", text: "おいしかったです！", time: "2023/01/15 16:50" },
        { user: "ねこいぬ", text: "季節限定がおすすめです！", time: "2023/01/15 16:55" }
        ]
      },
      { id: 5,
      name: "パティスリーテンアンド",
      address: "東京都千代田区内幸町１丁目７−１ 日比谷オクロジH01",
      nearest_station: "日比谷駅",
      eat_in: true,
      takeout: true,
      business_hours: "11:00~16:00, 17:30~21:00",
      closed_on: "水曜日",
      phone_number: "03-6807-5622",
      web_and_sns: "https://www.parola.tokyo/",
      comments: [
        { user: "いぬねこ", text: "おいしかったです！", time: "2023/01/15 16:50" },
        { user: "ねこいぬ", text: "季節限定がおすすめです！", time: "2023/01/15 16:55" }
        ]
      },
      { id: 6,
      name: "パティスリー サダハル アオキ パリ 丸の内店",
      address: "東京都千代田区丸の内３丁目４−１ 新国際ビル １階",
      nearest_station: "日比谷駅",
      eat_in: true,
      takeout: true,
      business_hours: "11:00〜20:00",
      closed_on: "水曜日",
      phone_number: "03-5293-2800",
      web_and_sns: "https://www.sadaharuaoki.jp/marunouchi/",
      comments: [
        { user: "いぬねこ", text: "おいしかったです！", time: "2023/01/15 16:50" },
        { user: "ねこいぬ", text: "季節限定がおすすめです！", time: "2023/01/15 16:55" }
        ]
      },
      { id: 7,
      name: "パティスリーG",
      address: "神奈川県横浜市中区",
      nearest_station: "横浜駅",
      eat_in: true,
      takeout: true,
      business_hours: "10:00〜20:00",
      closed_on: "水曜日",
      phone_number: "045-123-4567",
      web_and_sns: "https://example.com",
      comments: [
        { user: "いぬねこ", text: "おいしかったです！", time: "2023/01/15 16:50" },
        { user: "ねこいぬ", text: "季節限定がおすすめです！", time: "2023/01/15 16:55" }
        ]
      },
      { id: 8,
      name: "パティスリーH",
      address: "神奈川県横浜市中区",
      nearest_station: "横浜駅",
      eat_in: true,
      takeout: true,
      business_hours: "10:00〜20:00",
      closed_on: "水曜日",
      phone_number: "045-123-4567",
      web_and_sns: "https://example.com",
      comments: [
        { user: "いぬねこ", text: "おいしかったです！", time: "2023/01/15 16:50" },
        { user: "ねこいぬ", text: "季節限定がおすすめです！", time: "2023/01/15 16:55" }
        ]
      },
      { id: 9,
      name: "パティスリーI",
      address: "神奈川県横浜市中区",
      nearest_station: "横浜駅",
      eat_in: true,
      takeout: true,
      business_hours: "10:00〜20:00",
      closed_on: "水曜日",
      phone_number: "045-123-4567",
      web_and_sns: "https://example.com",
      comments: [
        { user: "いぬねこ", text: "おいしかったです！", time: "2023/01/15 16:50" },
        { user: "ねこいぬ", text: "季節限定がおすすめです！", time: "2023/01/15 16:55" }
        ]
      }
  ]
  @patisserie = @patisserie.find { |p| p[:id] == params[:id].to_i }
  end

  private

  def set_user
    @user = current_user
  end
end
