require 'test_helper'

class ProfileSerializerTest < ActiveSupport::TestCase
   

   def test_profile_serializer
   	  # school = schools(:one)
   	  profile = profiles(:one)
   	  serializer = ProfileSerializer.new(profile)

   	  profile = serializer.as_json()
      puts "*** serializer.as_json() #{serializer.as_json()}"
     
      assert_equal "male", profile[:gender]
   
   end

end
