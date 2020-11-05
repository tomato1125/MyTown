class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :search]

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
    @post.build_spot
    @post.images.build()
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.html{redirect_to root_path}
        format.json
      end
    else
      flash.now[:alert] = "必須項目を入力してください"
      @post.images.build
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
    if current_user.id !=@post.user_id
      flash.now[:alert] = "編集は投稿者しかできません"
      render :show
    end
  end

  # def update
  #   post = Post.find(params[:id])
  #   post.update(post_params)
  # end

  # def edit
  #   @item = Item.find(params[:id])
  #   set_category_sellector
  #   if current_user.id != @item.seller_id
  #     flash.now[:alert] = "編集は出品者しかできません"
  #     set_category
  #     render :show
  #   end
  # end

  def update
    post = Post.find(params[:id])
    if current_user.id != post.user_id
      flash.now[:alert] = "編集は出品者しかできません"
      render :edit and return
    end
    length = post.images.length
    i = 0
    while i < length do
      if  post_update_params[:images_attributes]["#{i}"]["_destroy"] == "0"
        post.update(post_update_params)
        redirect_to post_path(post.id), notice: "編集が完了しました"
        return
      else
        i += 1
      end
    end
    if post_update_params[:images_attributes]["#{i}"]
      post.update(post_update_params)
      redirect_to post_path(post.id), notice: "編集が完了しました"
    end
    redirect_to edit_post_path(post.id), alert: "画像は１枚以上挿入してください"
    return
  end

  def show
    @post = Post.find(params[:id])
    @clip = Clip.new
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
  end
  
  def search
    keyword = params[:keyword]
    return nil if params[:keyword] == ""
    @posts = Post.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :prefecture_id, :category_id, spot_attributes: [:id, :address, :latitude, :longitude], images_attributes: [:id, :image, :_destroy]).merge(user_id: current_user.id)
  end

  def post_update_params
    params.require(:post).permit(:title, :content, :prefecture_id, :category_id, spot_attributes: [:id, :address, :latitude, :longitude], images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
      flash[:alert] = "ログイン・新規登録してご利用ください"
    end
  end

end
