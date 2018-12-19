require 'test_helper'   

module Api
	module V1
		class SchoolsControllerTest < ActionController::TestCase
            
           
		    def test_index_response
			    get :index
			    assert_response :success
            end
            
            def test_show
            	@request.headers["Accept"] = "application/json"
            	school = schools(:one)
                puts school.id
			   	get :show, params: { id: school.id}
			   	puts response.body
			    assert_response :success 
			end

            def test_create
			    puts "ewqyhrwer"
			    school = schools(:one)
			    puts School.all.count
			    @request.headers["Accept"] = "application/json"
			    data = {school: {name: "ffff",code: "rrrrrrrrr"}}
			    post :create, {params: data}
                puts "count"
			    puts School.all.count
			    assert_response :success
			    
			end
               
            def test_update
            	school = schools(:one)
            	puts school.inspect
	            @request.headers["Accept"] = "application/json"
	            data = {school: {name: "loreal", code: "wdewrwe"}, id: school.id}
	            put :update, {params: data}
	            assert_response :success
	        end

	        # def test_destroy
         #        school = schools(:one)
         #        @request.headers["Accept"] = "application/json"
	        #     delete :destroy, {params: {id: school.id}}
	        #     assert_response :success
	        # end

	    end
	end
end

   #