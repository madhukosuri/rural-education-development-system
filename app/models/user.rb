class User < ApplicationRecord
   has_secure_password
   scope :recent, -> { where('created_at > ?', 1.week.ago) }
   has_one :profile
   has_many :posts
   validates :email, presence: true
      
   accepts_nested_attributes_for :profile

   devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
