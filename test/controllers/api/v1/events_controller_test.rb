require 'test_helper'

module Api
	module V1
		class EventsControllerTest < ActionController::TestCase
            
            def test_index_response
            	school = schools(:one)
			  	get :index, params: { school_id: school.id }
			  	assert_response :success
            end

            def test_show
            	school = schools(:one)
            	event = events(:one)
			   	get :show, params: { school_id: school.id, id: event.id }
			    assert_response :success
			end
       
             def test_create
			    school = schools(:one)
			    @request.headers["Accept"] = "application/json"
			    data = {event: {name: "ffff"}, school_id: school.id}
			    post :create, {params: data}
			    assert_response :success
			end

		    def test_update
		    	school = schools(:one)
		    	event = events(:one)	    
 		        @request.headers["Accept"] = "application/json"
 		        data = {event: {name: "jumping"}, school_id: school.id, id: event.id}
 		        put :update, {params: data}
 		        assert_response :success
 		    end    
		    
		    def test_destroy
		    	school = schools(:one)
		    	event = events(:one)
		    	@request.headers["Accept"] = "application/json"
		    	delete :destroy, {params: {id: event.id, school_id: school.id}}
                assert_response :success
            end    
		end
	end
end
      


