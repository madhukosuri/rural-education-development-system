require "test_helper"
module Api
	module V1
		class AdmissionsControllerTest < ActionController::TestCase
            
            def test_index_response
			  school = schools(:one)
			  get :index, params: { school_id: school.id}
			  assert_response :success
            end

		    def test_show
            	school = schools(:one)
            	admission = admissions(:one)
			   	get :show, params: { school_id: school.id, id: admission.id }
			    assert_response :success
			end

            def test_create
			    school = schools(:one)
			    @request.headers["Accept"] = "application/json"
			    data = {admission: {year: 1996}, school_id: school.id}
			    post :create, {params: data}
  			    assert_response :success
			end
		
            def test_update
               school = schools(:one)
               admission = admissions(:one)
               @request.headers["Accept"] = "application/json"
               data = {admission: {year: "1997",boys: 700, girls: 400}, school_id: school.id, id: admission.id}
               put :update, {params: data}
               assert_response :success		
            end
		
            def test_destroy
               school = schools(:one)
               admission = admissions(:one)
               @request.headers["Accept"] = "application/json"
               delete :destroy, {params: {id:admission.id, school_id:school.id}}
               assert_response :success
            end
		end
	end
end



   