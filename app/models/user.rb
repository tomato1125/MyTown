class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  validates :name, presence: true
  validates :email, presence: true
  validates :introduce, presence: true
  
  has_many :posts, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :cliped_posts, through: :clips, source: :post
  has_many :comments
  belongs_to :prefecture

  mount_uploader :image, ImageUploader

  def already_cliped?(post)
    self.clips.exists?(post_id: post.id)
  end
  
end
