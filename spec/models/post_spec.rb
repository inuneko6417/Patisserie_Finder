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
end
