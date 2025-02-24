require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  let(:post) { build(:post, user: user) }

  describe 'バリデーション' do
    it 'タイトルが必須であること' do
      post.title = ''
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("を入力してください")
    end

    it '本文が必須であること' do
      post.body = ''
      expect(post).not_to be_valid
      expect(post.errors[:body]).to include("を入力してください")
    end

    it 'タイトルが255文字以内であること' do
      post.title = 'a' * 256
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("は255文字以内で入力してください")
    end

    it 'CI確認用' do
      post.title = 'a' * 255
      expect(post).not_to be_valid
      expect(post.errors[:title]).to include("は255文字以内で入力してください")
    end

    it '本文が1000文字以内であること' do
      post.body = 'a' * 1001
      expect(post).not_to be_valid
      expect(post.errors[:body]).to include("は1000文字以内で入力してください")
    end

    it '有効な投稿が作成できること' do
      expect(post).to be_valid
    end
  end

  # describe 'アソシエーション' do
  #   it 'ユーザーに属していること' do
  #     assoc = described_class.reflect_on_association(:user)
  #     expect(assoc.macro).to eq :belongs_to
  #   end
  #   # 必要ならコメントとの関連もテスト
  #   it 'コメントを持っていること' do
  #     assoc = described_class.reflect_on_association(:comments)
  #     expect(assoc.macro).to eq :has_many
  #   end
  # end

  # describe 'スコープ・クラスメソッド' do
  #   before do
  #     create(:post, title: '古い投稿', created_at: 1.day.ago)
  #     create(:post, title: '新しい投稿', created_at: Time.current)
  #   end
  #
  #   it 'recentスコープが新しい順で並ぶこと' do
  #     expect(Post.recent.pluck(:title)).to eq ['新しい投稿', '古い投稿']
  #   end
  # end
end
