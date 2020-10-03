class NewpostsController < ApplicationController
  PER = 3
  
  def index
    @posts = Post.page(params[:page]).per(PER).order("created_at DESC")
  end
end
