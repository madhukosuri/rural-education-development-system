require 'test_helper'

class SchoolStaffSerializerTest < ActiveSupport::TestCase
   

   def test_school_staff_serializer
   	   # school = schools(:one)
   	  school_staff = school_staffs(:one)
   	  serializer = SchoolStaffSerializer.new(school_staff)

   	  school_staff = serializer.as_json()
      puts "*** serializer.as_json() #{serializer.as_json()}"
     
      assert_equal "harish", school_staff[:name]
      assert_equal "harish.gp520@gmail.com", school_staff[:email]
   end

end
