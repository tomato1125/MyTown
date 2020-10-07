class ClipsController < ApplicationController
  before_action :set_post

  def create
    @clip = Clip.create(user_id: current_user.id, post_id: @post.id)
  end

  def destroy
    @clip = Clip.find_by(user_id: current_user.id, post_id: @post.id).destroy
    redirect_to posts_path
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end

end
