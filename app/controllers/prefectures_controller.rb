class PrefecturesController < ApplicationController

  def show
    @prefecture = Prefecture.find(params[:prefecture_id])
    @prefectures = Post.where(prefecture_id: params[:prefecture_id]).order("created_at DESC")
    @prefecturePosts = @prefectures.page(params[:page]).per(5).order("created_at DESC")
  end
end
