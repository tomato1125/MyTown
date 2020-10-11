class UsersController < ApplicationController
  # before_action :set_user
  # before_action :user_params

  # def index
  # end

  def show
    @user = User.find(params[:id])
    @relationship = current_user.relationships.find_by(follow_id: @user.id)  
    @set_relationship = current_user.relationships.new
    @name = @user.name
    @posts = @user.posts
    @favorite = @posts.where(category_id: 0).count
    @image = @user.image
    @introduce = @user.introduce
    @prefecture = @user.prefecture.name
    @following_users = @user.followings.all
    @follow_users = @user.followers.all

    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
    
    # チャートグラフ用のインスタンス
    @favorite = @posts.where(category_id: 0).count
    @food = @posts.where(category_id: 1).count
    @shopping = @posts.where(category_id: 2).count
    @nature = @posts.where(category_id: 3).count
    @event = @posts.where(category_id: 4).count
    gon.favorite = @favorite
    gon.food = @food
    gon.shopping = @shopping
    gon.nature = @nature
    gon.event = @event
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
