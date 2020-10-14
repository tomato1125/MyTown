class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:notice] = "ユーザーをフォローしました"
      redirect_back(fallback_location: root_path)
    else
      flash.now[:alert] = "ユーザーのフォローに失敗しました"
      redirect_to @user
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:notice] = "ユーザーのフォローを解除しました"
      redirect_to @user
    else
      flash.now[:alert] = "ユーザーのフォロー解除に失敗しました"
      redirect_to @user
    end
  end

  private
  def set_user
    @user = User.find(params[:relationship][:follow_id])
  end
end
