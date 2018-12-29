class School < ApplicationRecord
    has_many :school_staffs, dependent: :destroy
    has_many :admissions, dependent: :destroy
    has_many :events, dependent: :destroy
    validates :name, :code, presence: true
    mount_uploaders :school_images, SchoolImageUploader
    mount_uploader :video, VideoUploader
end
