class UsersController < ApplicationController
  before_action :move_to_index

  def show
    @user = User.find(params[:id])
    @relationship = current_user.relationships.find_by(follow_id: @user.id)  
    @set_relationship = current_user.relationships.new
    @name = @user.name
    @posts = @user.posts.page(params[:page]).per(5).order("created_at DESC")
    @bookmarks = @user.cliped_posts.page(params[:page]).per(5).order("created_at DESC")
    respond_to do |format|
      format.html
      format.js
    end
    # @favorite = @posts.where(category_id: 0).count
    @image = @user.image
    @introduce = @user.introduce
    @prefecture = @user.prefecture.name
    @following_users = @user.followings.all
    @follower_users = @user.followers.all

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
    
    # チャートグラフ(カテゴリー別）用データのインスタンス
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

    # チャートグラフ（都道府県別）用のインスタンス
    @prefecture0 = @posts.where(prefecture_id: 0).count
    @prefecture1 = @posts.where(prefecture_id: 1).count
    @prefecture2 = @posts.where(prefecture_id: 2).count
    @prefecture3 = @posts.where(prefecture_id: 3).count
    @prefecture4 = @posts.where(prefecture_id: 4).count
    @prefecture5 = @posts.where(prefecture_id: 5).count
    @prefecture6 = @posts.where(prefecture_id: 6).count
    @prefecture7 = @posts.where(prefecture_id: 7).count
    @prefecture8 = @posts.where(prefecture_id: 8).count
    @prefecture9 = @posts.where(prefecture_id: 9).count
    @prefecture10 = @posts.where(prefecture_id: 10).count
    @prefecture11 = @posts.where(prefecture_id: 11).count
    @prefecture12 = @posts.where(prefecture_id: 12).count
    @prefecture13 = @posts.where(prefecture_id: 13).count
    @prefecture14 = @posts.where(prefecture_id: 14).count
    @prefecture15 = @posts.where(prefecture_id: 15).count
    @prefecture16 = @posts.where(prefecture_id: 16).count
    @prefecture17 = @posts.where(prefecture_id: 17).count
    @prefecture18 = @posts.where(prefecture_id: 18).count
    @prefecture19 = @posts.where(prefecture_id: 19).count
    @prefecture20 = @posts.where(prefecture_id: 20).count
    @prefecture21 = @posts.where(prefecture_id: 21).count
    @prefecture22 = @posts.where(prefecture_id: 22).count
    @prefecture23 = @posts.where(prefecture_id: 23).count
    @prefecture24 = @posts.where(prefecture_id: 24).count
    @prefecture25 = @posts.where(prefecture_id: 25).count
    @prefecture26 = @posts.where(prefecture_id: 26).count
    @prefecture27 = @posts.where(prefecture_id: 27).count
    @prefecture28 = @posts.where(prefecture_id: 28).count
    @prefecture29 = @posts.where(prefecture_id: 29).count
    @prefecture30 = @posts.where(prefecture_id: 30).count
    @prefecture31 = @posts.where(prefecture_id: 31).count
    @prefecture32 = @posts.where(prefecture_id: 32).count
    @prefecture33 = @posts.where(prefecture_id: 33).count
    @prefecture34 = @posts.where(prefecture_id: 34).count
    @prefecture35 = @posts.where(prefecture_id: 35).count
    @prefecture36 = @posts.where(prefecture_id: 36).count
    @prefecture37 = @posts.where(prefecture_id: 37).count
    @prefecture38 = @posts.where(prefecture_id: 38).count
    @prefecture39 = @posts.where(prefecture_id: 39).count
    @prefecture40 = @posts.where(prefecture_id: 40).count
    @prefecture41 = @posts.where(prefecture_id: 41).count
    @prefecture42 = @posts.where(prefecture_id: 42).count
    @prefecture43 = @posts.where(prefecture_id: 43).count
    @prefecture44 = @posts.where(prefecture_id: 44).count
    @prefecture45 = @posts.where(prefecture_id: 45).count
    @prefecture46 = @posts.where(prefecture_id: 46).count
    gon.prefecture0 = @prefecture0
    gon.prefecture1 = @prefecture1
    gon.prefecture2 = @prefecture2
    gon.prefecture3 = @prefecture3
    gon.prefecture4 = @prefecture4
    gon.prefecture5 = @prefecture5
    gon.prefecture6 = @prefecture6
    gon.prefecture7 = @prefecture7
    gon.prefecture8 = @prefecture8
    gon.prefecture9 = @prefecture9
    gon.prefecture10 = @prefecture10
    gon.prefecture12 = @prefecture12
    gon.prefecture13 = @prefecture13
    gon.prefecture14 = @prefecture14
    gon.prefecture15 = @prefecture15
    gon.prefecture16 = @prefecture16
    gon.prefecture17 = @prefecture17
    gon.prefecture18 = @prefecture18
    gon.prefecture19 = @prefecture19
    gon.prefecture20 = @prefecture20
    gon.prefecture21 = @prefecture21
    gon.prefecture22 = @prefecture22
    gon.prefecture23 = @prefecture23
    gon.prefecture24 = @prefecture24
    gon.prefecture25 = @prefecture25
    gon.prefecture26 = @prefecture26
    gon.prefecture27 = @prefecture27
    gon.prefecture28 = @prefecture28
    gon.prefecture29 = @prefecture29
    gon.prefecture30 = @prefecture30
    gon.prefecture31 = @prefecture31
    gon.prefecture32 = @prefecture32
    gon.prefecture33 = @prefecture33
    gon.prefecture34 = @prefecture35
    gon.prefecture36 = @prefecture36
    gon.prefecture37 = @prefecture37
    gon.prefecture38 = @prefecture38
    gon.prefecture39 = @prefecture39
    gon.prefecture40 = @prefecture40
    gon.prefecture41 = @prefecture41
    gon.prefecture42 = @prefectur42
    gon.prefecture43 = @prefecture43
    gon.prefecture44 = @prefecture44
    gon.prefecture45 = @prefecture45
    gon.prefecture46 = @prefecture46
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
    @follower_users = @user.followers.all
    @relationship = current_user.relationships.find_by(follow_id: @user.id)  
    @set_relationship = current_user.relationships.new
  end

  def followers
    @user = User.find(params[:id])
    @follower_users = @user.followers.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :introduce, :prefecture_id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to :root
      flash[:alert] = "ログイン・新規登録してご利用ください"
    end
  end

end
