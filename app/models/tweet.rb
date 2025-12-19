class Tweet < ApplicationRecord
  # ユーザーとの紐付け
  belongs_to :user

  # いいね機能のアソシエーション
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  # メディア投稿（画像・動画）の設定
  has_one_attached :image
  mount_uploader :video, VideoUploader

  # ユーザーがすでにそのツイートを「いいね」しているか判定するメソッド
  # ビュー側で tweet.liked_by?(current_user) として使用します
  def liked_by?(user)
    likes.exists?(user_id: user.id)
  end
end