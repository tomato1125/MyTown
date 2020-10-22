class CategoriesController < ApplicationController
  def index
  end

  def show
    @category = Category.find(params[:category_id])
    @categories = Post.where(category_id: params[:category_id]).order("created_at DESC")
  end
end
