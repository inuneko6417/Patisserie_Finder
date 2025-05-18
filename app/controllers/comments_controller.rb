class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.turbo_stream
        format.html { redirect_to post_path(@comment.post), notice: t("コメントが作成されました") }
      else
        format.html { redirect_to post_path(@comment.post), alert: t("コメントの作成に失敗しました") }
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
