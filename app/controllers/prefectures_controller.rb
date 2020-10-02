class PrefecturesController < ApplicationController
  # def index
  #   prefecture = Post.where(prefecture_id: params[:prefecture_id])
  #   @prefecture = Prefecture.find(params[:prefecture_id])
  # end

  def show
    @prefecture = Prefecture.find(params[:prefecture_id])
    @prefectures = Post.where(prefecture_id: params[:prefecture_id])
  end
end
