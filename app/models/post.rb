class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates :image, presence: true

  belongs_to :user
  belongs_to :prefecture
  belongs_to :category
  has_many :comments
  has_one :spot, dependent: :destroy

  accepts_nested_attributes_for :spot, allow_destroy: true

  mount_uploader :image, ImageUploader

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
