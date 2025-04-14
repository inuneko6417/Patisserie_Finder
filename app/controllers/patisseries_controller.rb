class PatisseriesController < ApplicationController
  before_action :set_user
  def index
    @patisseries = [
      { id: 1, name: "ル･ミリュウ 鎌倉山", description: "絶景カフェ併設", image: "le_milieu.png" },
      { id: 2, name: "パティスリー アンカド（patisserie un cadeau）", description: " 芸術的なケーキ", image: "un_cadeau.png" },
      { id: 3, name: "パティスリーエスポワール", description: "地元に愛される店", image: "espoir.png" },
      { id: 4, name: "パティスリー・ラ・ベルデュール", description: "季節感あふれる洋菓子", image: "la_verdure.png" },
      { id: 5, name: "パティスリーテンアンド", description: "シンプル＆上品", image: "ten&.png" },
      { id: 6, name: "パティスリー サダハル アオキ パリ 丸の内店", description: "本場フランスの味", image: "sadaharu_aoki.png" },
      { id: 7, name: "パティスリーグランディール", description: "手作りの温かみ", image: "grandir.png" },
      { id: 8, name: "Patisserie Coeur&Heart", description: "ハート型スイーツ", image: "Coeur&Heart.png" },
      { id: 9, name: "ラ·ブティック·ドゥ·ユキノシタ·カマクラ", description: "ミルフィーユが名物", image: "kamakura_yukinosita.png" }
    ]
  end

  def show
    @patisseries = [
      { id: 1, name: "ル･ミリュウ 鎌倉山", description: "絶景カフェ併設" },
      { id: 2, name: "パティスリー アンカド（patisserie un cadeau）", description: " 芸術的なケーキ" },
      { id: 3, name: "パティスリーエスポワール", description: "地元に愛される店" },
      { id: 4, name: "パティスリー・ラ・ベルデュール", description: "季節感あふれる洋菓子" },
      { id: 5, name: "パティスリーテンアンド", description: "シンプル＆上品" },
      { id: 6, name: "パティスリー サダハル アオキ パリ 丸の内店", description: "本場フランスの味" },
      { id: 7, name: "パティスリーグランディール", description: "手作りの温かみ" },
      { id: 8, name: "Patisserie Coeur&Heart", description: "ハート型スイーツ" },
      { id: 9, name: "ラ·ブティック·ドゥ·ユキノシタ·カマクラ", description: "ミルフィーユが名物" }
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
        image: "le_milieu.png"
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
        image: "un_cadeau.png"
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
        image: "espoir.png"
        },
        { id: 4,
        name: "パティスリー・ラ・ベルデュール",
        address: "神奈川県横浜市泉区緑園５丁目２９−２０",
        nearest_station: "緑園都市駅",
        eat_in: false,
        takeout: true,
        business_hours: "10:00〜19:00",
        closed_on: "月曜日",
        phone_number: "045-811-5123",
        web_and_sns: "https://www.verdure.co.jp/",
        image: "la_verdure.png"
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
        image: "ten&.png"
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
        image: "sadaharu_aoki.png"
        },
        { id: 7,
        name: "パティスリーグランディール",
        address: "神奈川県大和市大和東３丁目１５−５",
        nearest_station: "大和駅",
        eat_in: false,
        takeout: true,
        business_hours: "10:00〜18:00",
        closed_on: "火,水曜日",
        phone_number: "046-264-7508",
        web_and_sns: "https://yyamato.com/patisserie-grandir/",
        image: "grandir.png"
        },
        { id: 8,
        name: "Patisserie Coeur&Heart",
        address: "東京都町田市金井５丁目１９−１７ グランデュール金井",
        nearest_station: "鶴川駅",
        eat_in: false,
        takeout: true,
        business_hours: "10:00〜19:00",
        closed_on: "水曜日",
        phone_number: "042-860-2066",
        web_and_sns: "https://www.coeur-and-heart.info/",
        image: "Coeur&Heart.png"
        },
        { id: 9,
        name: "ラ·ブティック·ドゥ·ユキノシタ·カマクラ",
        address: "神奈川県鎌倉市小町２丁目１２−２５ 第一寿店舗",
        nearest_station: "鎌倉駅",
        eat_in: false,
        takeout: true,
        business_hours: "10:00〜18:00",
        closed_on: "不定休",
        phone_number: "0467-539-692",
        web_and_sns: "https://www.sadaharuaoki.jp/marunouchi/",
        image: "kamakura_yukinosita.png"
        }
    ]
    @patisserie = @patisserie.find { |p| p[:id] == params[:id].to_i }
  end

  private

  def set_user
    @user = current_user
  end
end
