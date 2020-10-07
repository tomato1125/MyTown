class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  # before_action :set_post_info, only: [:show]

  def index
    @posts = Post.includes(:user).order("created_at DESC")
  end

  def new
    @post = Post.new
    @post.build_spot
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
  end

  def show
    @post = Post.find(params[:id])
    @clip = Clip.new
    @lat = @post.spot.latitude
    @lng = @post.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
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
    params.require(:post).permit(:title, :image, :content, :prefecture_id, :category_id, spot_attributes: [:id, :address, :latitude, :longtitude]).merge(user_id: current_user.id)
  end

  # def set_post_info
  #   if params[:id].present? 
  #     @post = Post.find(params[:id])
  #   end
  # end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
