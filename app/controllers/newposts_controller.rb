class NewpostsController < ApplicationController
  
  def index
    @posts = Post.page(params[:page]).per(5).order("created_at DESC")

    respond_to do |format|
      format.html
      format.js
    end
  end
end
