class User < ApplicationRecord
  rolify
   scope :recent, -> { where('created_at > ?', 1.week.ago) }
   has_one :profile, dependent: :destroy
   has_many :posts
   validates :email, presence: true
   accepts_nested_attributes_for :profile
   devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
   mount_uploader :avatar, AvatarUploader
end


