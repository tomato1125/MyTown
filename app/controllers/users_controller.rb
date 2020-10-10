class UsersController < ApplicationController
  # before_action :user_params

  # def index
  # end

  def show
    @user = User.find(params[:id])
    @relationship = current_user.relationships.find_by(follow_id: @user.id)  
    @set_relationship = current_user.relationships.new
    @name = @user.name
    @posts = @user.posts
    @image = @user.image
    @introduce = @user.introduce
    @prefecture = @user.prefecture.name
    @following_users = @user.followings.all
    @follow_users = @user.followers.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @following_users = @user.followings.all
  end

  def followers
    @user = User.find(params[:id])
    @follow_users = @user.followers.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :introduce, :prefecture_id)
  end
end
