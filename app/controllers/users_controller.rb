class UsersController < ApplicationController
  # before_action :user_params

  # def index
  # end

  def show
    @user = User.find(params[:id])
    @name = @user.name
    @posts = @user.posts
    @image = @user.image
    @introduce = @user.introduce
    @prefecture = @user.prefecture.name
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

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :introduce, :prefecture_id)
  end
end
