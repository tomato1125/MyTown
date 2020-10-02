class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  
  validates :name, presence: true
  validates :email, presence: true
  validates :introduce, presence: true
  
  has_many :posts
  has_many :comments
  belongs_to :prefecture

  mount_uploader :image, ImageUploader
end
