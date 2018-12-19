require 'test_helper'

class AdmissionSerializerTest < ActiveSupport::TestCase
   

   def test_admission_serializer
   	  # school = schools(:one)
   	  admission = admissions(:one)
   	  serializer = AdmissionSerializer.new(admission)

   	  admission = serializer.as_json()
      puts "*** serializer.as_json() #{serializer.as_json()}"
     
      assert_equal 1000, admission[:boys]
   
   end

end
