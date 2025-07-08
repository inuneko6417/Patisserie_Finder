class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result.by_comments_count.includes(:user).order(created_at: :desc).page(params[:page]).per(12)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, notice: "記事を更新しました"
    else
      flash.now[:alert] = "記事の更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path, alert: "記事を削除しました"
  end

  def show
    @post = Post.find(params[:id])
    @images = @post.images
    @comment = @post.comments.build(user: current_user) # 投稿と紐付け
    @comments = @post.comments.includes(:user).order(created_at: :desc)

    set_meta_tags(
      title: @post.title,
      description: @post.body.truncate(100),
      og: {
        title: @post.title,
        description: @post.body.truncate(100),
        image: @post.images.attached? ? url_for(@post.images.first) : image_url("ogp.png")
      },
      twitter: {
        card: "summary_large_image",
        image: @post.images.attached? ? url_for(@post.images.first) : image_url("ogp.png")
      }
    )
  end


  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to @post, notice: "投稿が作成されました"
    else
      flash.now[:alert] = "投稿の作成に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def ranking
    @posts = Post.by_comments_count.includes(:user)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, images: [])
  end

  def authenticate_user!
    unless user_signed_in?
      redirect_to signup_path, alert: "掲示板作成には新規登録が必要です"
    end
  end
end
