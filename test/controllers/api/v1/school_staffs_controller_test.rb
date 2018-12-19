require 'test_helper'

module Api
	module V1
		class SchoolStaffsControllerTest < ActionController::TestCase
            
          def test_index_response
              school = schools(:one)
		  	      get :index, params: { school_id: school.id }
		  	      assert_response :success
          end
	
          def test_show
              school = schools(:one)
              school_staff  = school_staffs(:one)
              get :show, params: { school_id: school.id, id:school_staff.id }
              assert_response :success
          end
      
          def test_create
              school = schools(:one)
              @request.headers["Accept"] = "application/json"
              data = {school_staff: {name: "ffff", email: "rrrrrrr@gmail.com"}, school_id: school.id}
              post :create, {params: data}
              assert_response :success
          end

          def test_update
            school = schools(:one)
            school_staff = school_staffs(:one)
            puts school.inspect
            @request.headers["Accept"] = "application/json"
            data = { school_staff: {name: "ffff", email: "rrrrrrr@gmail.com"}, school_id: school.id, id: school_staff.id,}
            put :update, { params: data }
            assert_response :success
          end

          def test_destroy
            school = schools(:one)
            puts "schools information"
            school_staff = school_staffs(:one)
            puts school_staff
            puts SchoolStaff.count
            @request.headers["Accept"] = "application/json"
            delete :destroy, {params: {id: school_staff.id, school_id: school.id}}
            puts SchoolStaff.count

          end      

		end
	end
end




