class PatisseriesController < ApplicationController
  def ranking
  end

  def index
    @patisseries = [
      { id: 1, name: 'パティスリーA', description: '人気No.1のケーキショップ', rank: 1 },
      { id: 2, name: 'パティスリーB', description: '新鮮なフルーツを使用', rank: 2 },
      { id: 3, name: 'パティスリーC', description: '地元で愛されるケーキ', rank: 3 },
      { id: 4, name: 'パティスリーD', description: '特製スイーツが人気', rank: 4 },
      { id: 5, name: 'パティスリーE', description: 'チョコレートケーキが絶品', rank: 5 },
      { id: 6, name: 'パティスリーF', description: 'アットホームな雰囲気', rank: 6 },
      { id: 7, name: 'パティスリーG', description: '職人技が光るケーキ', rank: 7 },
      { id: 8, name: 'パティスリーH', description: '絶妙な甘さが特徴', rank: 8 },
      { id: 9, name: 'パティスリーI', description: '美しいデザインケーキ', rank: 9 },
    ]
  end

def show
  @patisseries = [
      { id: 1, name: 'パティスリーA', description: '人気No.1のケーキショップ', rank: 1 },
      { id: 2, name: 'パティスリーB', description: '新鮮なフルーツを使用', rank: 2 },
      { id: 3, name: 'パティスリーC', description: '地元で愛されるケーキ', rank: 3 },
      { id: 4, name: 'パティスリーD', description: '特製スイーツが人気', rank: 4 },
      { id: 5, name: 'パティスリーE', description: 'チョコレートケーキが絶品', rank: 5 },
      { id: 6, name: 'パティスリーF', description: 'アットホームな雰囲気', rank: 6 },
      { id: 7, name: 'パティスリーG', description: '職人技が光るケーキ', rank: 7 },
      { id: 8, name: 'パティスリーH', description: '絶妙な甘さが特徴', rank: 8 },
      { id: 9, name: 'パティスリーI', description: '美しいデザインケーキ', rank: 9 },
    ]

  # サンプルデータ
  @patisserie = {
      name: 'パティスリーA',
      address: '神奈川県横浜市中区',
      nearest_station: '横浜駅',
      eat_in: true,
      takeout: true,
      business_hours: '10:00〜20:00',
      closed_on: '水曜日',
      phone_number: '045-123-4567',
      web_and_sns: 'https://example.com',
      comments: [
        { user: 'いぬねこ', text: 'おいしかったです！', time: '2023/01/15 16:50' },
        { user: 'ねこいぬ', text: '季節限定がおすすめです！', time: '2023/01/15 16:55' },
      ]
    }
  end
end
