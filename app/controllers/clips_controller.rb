class ClipsController < ApplicationController

  def create
    @clip = current_user.clips.create(post_id: params[:post_id])
    if @clip.save
      post = Post.find(params[:post_id])
      post.create_notification_clip!(current_user)
      flash[:notice] = 'Bookmarkに登録しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Bookmark登録に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @clip = Clip.find_by(post_id: params[:post_id], user_id: current_user.id)
    if @clip.destroy
      flash[:notice] = 'Bookmarkを解除しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = 'Bookmarkの解除に失敗しました'
      redirect_back(fallback_location: root_path)
    end
  end

end
