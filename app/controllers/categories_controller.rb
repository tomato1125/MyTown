class CategoriesController < ApplicationController
  before_action :move_to_index

  def index
  end

  def show
    @category = Category.find(params[:category_id])
    @categories = Post.where(category_id: params[:category_id])
    @categoryPosts = @categories.page(params[:page]).per(5).order("created_at DESC")
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to root_path
      flash[:alert] = "ログイン・新規登録してご利用ください"
    end
  end
end
