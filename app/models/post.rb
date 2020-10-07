class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :prefecture
  belongs_to :category

  has_many :clips, dependent: :destroy
  has_many :cliped_users, through: :clips, source: :user
  has_many :comments, dependent: :destroy
  has_one :spot, dependent: :destroy

  accepts_nested_attributes_for :spot, allow_destroy: true

  mount_uploader :image, ImageUploader

  
end
