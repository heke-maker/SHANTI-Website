class Tweet < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    mount_uploader :video, VideoUploader

    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
end
