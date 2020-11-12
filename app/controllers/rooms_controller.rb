class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @current_user = current_user
    @current_entries = @current_user.entries
    myroom = []

    # current_userのroom.idを格納
    @current_entries.each do |entry|
      myroom << entry.room.id
    end

    # 最新のメッセージのデータを取得する。
    message = room.messages.order(updated_at: :desc).limit(1)
    message = message[0]

    # current_userと相手側のユーザーが格納されているレコードを探す処理
    @another_entries = Entry.where(room_id: myroom).where.not(user_id: @current_user.id)
    @new_entries = @another_entries.order(created_at: :desc)
  end

  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages.order("created_at DESC")
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  # def join_room_params
  #   params.require(:entry).permit(:user_id, :room_id).merge(room_id: @room.id)
  # end
end
