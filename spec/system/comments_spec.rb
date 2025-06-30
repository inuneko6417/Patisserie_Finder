require 'rails_helper'

RSpec.describe "Comments", type: :system do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  before do
    sign_in user
    visit post_path(post)
  end

  describe "コメントの作成" do
    it "空の場合、コメントは作成されない" do
      expect {
        click_button "投稿"
      }.not_to change(Comment, :count)

      expect(page).to have_content("コメントの作成に失敗しました").or have_no_css("#comments div.comment")
    end

    it "コメントを入力すれば作成される" do
      fill_in "コメント", with: "これはテストコメントです"
      expect {
        click_button "投稿"
        expect(page).to have_content("これはテストコメントです")
      }.to change(Comment, :count).by(1)
    end
  end

  describe "コメントの削除" do
    let!(:comment) { create(:comment, user:, post:, body: "削除対象コメント") }

    before do
      visit post_path(post)
    end

    it "削除できること" do
      accept_confirm do
        click_link "削除", href: comment_path(comment)
      end

      expect(page).to have_content("コメントを削除しました")
      expect(page).not_to have_content("削除対象コメント")
      expect(Comment.exists?(comment.id)).to be_falsey
    end
  end
end
