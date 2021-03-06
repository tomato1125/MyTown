class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :images, presence: true

  belongs_to :user
  belongs_to :prefecture
  belongs_to :category

  has_many :images, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :cliped_users, through: :clips, source: :user
  has_many :comments, dependent: :destroy

  has_many :notifications, dependent: :destroy

  has_one :spot, dependent: :destroy

  accepts_nested_attributes_for :spot, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true

  # mount_uploader :image, ImageUploader

  def self.search(search)
    if search != ""
      Post.joins(:prefecture).where('content LIKE(?) OR title LIKE(?) OR prefectures.name LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Post.all
    end
  end


  def create_notification_clip!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_id = ? and action = ? ", current_user.id, user_id, id, 'clip'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_id: id,
        visited_id: user_id,
        action: 'clip'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      if notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(post_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end