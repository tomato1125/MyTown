class MessagesController < ApplicationController
  # before_action :set_room, only: [:create, :edit, :update, :destroy]
  # before_action :set_message, only: [:edit, :update, :destroy]

  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
      @message = Message.new(message_params)
      
      @message.save
      @message.create_notification_dm!(current_user, @message.id, @room_id)
      flash[:notice] = 'ダイレクトメッセージを送信しました'
      # redirect_to "/rooms/#{@message.room_id}"
      # redirect_to post_path(params[:post_id])
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "メッセージの送信に失敗しました"
      redirect_back(fallback_location: root_path)
    end
  end
  

  def edit
  end

  def update
    if @message.update(message_params)
      gets_entries_all_messages
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  # def set_room
  #   @room = Room.find(params[:message][:room_id])
  # end

  # def set_message
  #   @message = Message.find(params[:id])
  # end

  def gets_entries_all_messages
    @messages = @room.messages.includes(:user).order("created_at DESC")
    @entries = @room.entries
  end

  def message_params
    params.require(:message).permit(:message, :room_id).merge(user_id: current_user.id)
  end
end
