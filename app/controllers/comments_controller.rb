class CommentsController < ApplicationController
  def create
      if user_signed_in?
        @comment = current_user.comments.build(comment_params)
        respond_to do |format|
          if @comment.save
            format.turbo_stream
            format.html { redirect_to post_path(@comment.post), notice: t('defaults.comment_create_success') }
          else
            format.turbo_stream
            format.html { redirect_to post_path(@comment.post), alert: t('defaults.comment_create_failed') }
          end
        end
      else
        @comment = Comment.new # 空のコメントをセット
        flash.now[:alert] = t('defaults.login_required')
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace("comment-form", partial: "comments/form", locals: { comment: @comment, post: Post.find(params[:post_id]) }) }
          format.html { redirect_to login_path, alert: t('defaults.login_required') }
        end
      end
    end

  def destroy
    @comment = current_user.comments.find(params[:id])
    @comment.destroy!

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to post_path(@comment.post), notice: t("コメントが削除されました") }
    end
  end


  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end
end
