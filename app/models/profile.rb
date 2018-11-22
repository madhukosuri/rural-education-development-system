class Profile < ApplicationRecord
  belongs_to :user
end







# {"user": {"first_name": "satyabhavan","last_name": "1sdhgd","email": "gfdshgcdsa@gmail.com", "password": "madhu1234", "profile_attributes": {"gender": "male"}}}

# {"user": {"first_name": "bhavani","last_name": "kumari","email": "sdhgdhewf@gmail.com", "password": "madhu1234234", "profile_attributes": {"gender": "female","date_of_birth": "12/04/1977","current_city": "eluru","mobile_number": "6455"}}}