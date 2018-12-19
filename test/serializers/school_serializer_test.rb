
require 'test_helper'

class SchoolSerializerTest < ActiveSupport::TestCase
   

   def test_school_serializer
   	  school = schools(:one)
   	  serializer = SchoolSerializer.new(school)

   	  school = serializer.as_json()

        puts school.to_json
        puts "*** serializer.as_json() #{serializer.as_json()}"
      # puts school[:id]
      # puts school[:name]
      # puts school[:code]
      # puts school[:staffs_count]
      # puts school[:school_staffs][0][:name]
      # puts school[:school_staffs][0][:email]
      # puts school[:school_staffs][0][:created_at]
      # puts school[:school_staffs][1][:id]

      assert_equal "zhhs", school[:name]
      assert_equal "abcde", school[:code]
      assert_equal 980190962, school[:id]




      assert_equal 113629430, school[:school_staffs][0][:id]
      assert_equal "babi", school[:school_staffs][0][:name]    
      assert_equal "babi@gmail.com", school[:school_staffs][0][:email]
      assert_equal "siva", school[:school_staffs][1][:name]    
    
      assert_equal 298486374, school[:events][0][:id]
      assert_equal "running", school[:events][0][:name]    
    
      assert_equal 980190962, school[:admissions][0][:id]
      assert_equal "2018", school[:admissions][0][:year]    
      assert_equal 1000, school[:admissions][0][:boys]

    end

end




# assert_equal "male", @user.profile.gender