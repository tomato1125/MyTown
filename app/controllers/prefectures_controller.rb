class PrefecturesController < ApplicationController
  before_action :move_to_index, 

  def show
    @prefecture = Prefecture.find(params[:prefecture_id])
    @prefectures = Post.where(prefecture_id: params[:prefecture_id]).order("created_at DESC")
    @prefecturePosts = @prefectures.page(params[:page]).per(5).order("created_at DESC")
  end

  
  private
  def move_to_index
    unless user_signed_in?
      redirect_to root_path
      flash[:alert] = "ログイン・新規登録してご利用ください"
    end
  end
end
