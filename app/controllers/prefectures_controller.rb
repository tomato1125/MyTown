class PrefecturesController < ApplicationController

  def show
    @prefecture = Prefecture.find(params[:prefecture_id])
    @prefectures = Post.where(prefecture_id: params[:prefecture_id])
  end
end
