class SchoolStaff < ApplicationRecord
  belongs_to :school
  # validates :name, :email, presence: true
end
