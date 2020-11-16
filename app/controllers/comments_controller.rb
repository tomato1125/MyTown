class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id])  }
      format.json
    end
    @post = @comment.post

    @post.create_notification_comment!(current_user, @comment.id)
      # flash[:notice] = 'コメントを投稿しました'
      # redirect_back(fallback_location: @post_path)
    # else
    #   # render 'posts/show'
    #   flash[:alert] = "メッセージ送信に失敗しました。"
    # end
    # render 'posts/show'
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
