class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one :profile
  # , as: :profilizable
      
  accepts_nested_attributes_for :profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end