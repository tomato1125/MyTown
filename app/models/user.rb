class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  validates :email, presence: true
  validates :introduce, presence: true
  
  has_many :posts, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :cliped_posts, through: :clips, source: :post
  has_many :comments
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :rooms, through: :entries
  
  belongs_to :prefecture
  
  has_many :relationships, foreign_key: "user_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  validates :name, presence: true, length: { maximum: 10 }
  # validates :prefecture_id, presence: true

  mount_uploader :image, ImageUploader

  def already_cliped?(post)
    self.clips.exists?(post_id: post.id)
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end

end
