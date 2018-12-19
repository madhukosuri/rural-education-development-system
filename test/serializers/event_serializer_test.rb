require 'test_helper'

class EventSerializerTest < ActiveSupport::TestCase
   

   def test_event_serializer
   	  # school = schools(:one)
   	  event = events(:one)
   	  serializer = EventSerializer.new(event)

   	  event = serializer.as_json()
      puts "*** serializer.as_json() #{serializer.as_json()}"
     
      assert_equal 980190962, event[:id]
      assert_equal "dance", event[:name]
   end

end
