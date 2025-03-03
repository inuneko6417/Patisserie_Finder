class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to post_path(comment.post), success: t("コメント作成しました", item: Comment.model_name.human)
    else
      redirect_to post_path(comment.post), danger: t("コメント削除しました", item: Comment.model_name.human)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(post_id: params[:post_id])
  end
end
