class Post < ApplicationRecord
	belongs_to :user
	has_many :postcomment, dependent: :destroy
	validates :title,:body, presence: true
	validates :title, length: { in: 3..20 }

	mount_uploader :photo, PhotoUploader

end
