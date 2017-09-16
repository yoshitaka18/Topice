class Blog < ActiveRecord::Base
  validates :title, :content, :picture,  presence: true
  mount_uploader :picture, PictureUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
end
