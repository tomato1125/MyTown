class ClipsController < ApplicationController

  def create
    @clip = current_user.clips.create(post_id: params[:post_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @clip = Clip.find_by(post_id: params[:post_id], user_id: current_user.id)
    @clip.destroy
    redirect_back(fallback_location: root_path)
  end

end
