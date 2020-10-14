class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  has_many :notifications, dependent: :destroy

  # validates :message, presence: true

  def create_notification_dm!(current_user, message_id, room_id)
    temp_ids=Entry.where(room_id: room.id).where.not(user_id: current_user.id)
    @temp_ids = temp_ids.find_by(room_id: room.id)
    notification = current_user.active_notifications.new(
        room_id: room_id,
        message_id: message_id,
        visited_id: @temp_ids.user_id,
        action: 'dm'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
        notification.checked = true
    end
    notification.save if notification.valid?
  end
end
