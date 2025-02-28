class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id]) # 単一の投稿を取得
    @images = @post.images
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      flash[:success] = "投稿が作成されました"
      redirect_to @post
    else
      flash[:error] = "投稿の作成に失敗しました"
      render :new
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id, images: [])
  end
end
