class School < ApplicationRecord
    has_many :school_staffs
    has_many :admissions, dependent: :destroy
    has_many :events
     
    validates :name, :code, presence: true
   

    # validates :name, :code, uniqueness: true


	  # after_initialize do |school|
	  #   puts "You have initialized an object!"
	  # end
	 
	  # after_find do |school|
	  #   puts "You have found an object!"
	  # end

	  # after_touch do |user|
	  #   puts "You have touched an object"
	  # end

	# def school_info
	# 	return 'lllll'
	# end
end
