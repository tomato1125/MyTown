class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @post = @comment.post
    if @comment.save
      @post.create_notification_comment!(current_user, @comment.id)
      flash[:notice] = 'コメントを投稿しました'
      redirect_back(fallback_location: @post_path)
    else
      render 'posts/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

end
