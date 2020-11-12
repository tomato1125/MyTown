class NewpostsController < ApplicationController
  
  def index
    @posts = Post.page(params[:page]).per(5).order("created_at DESC")
  end
end
