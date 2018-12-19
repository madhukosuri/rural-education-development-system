require "test_helper"
module Api
	module V1
		class UsersControllerTest < ActionController::TestCase
            
            def test_index_response
			  get :index
			  assert_response :success
            end

		    def test_show
            	user = users(:one)
            	puts user.id
			   	get :show, params: { id: user.id}
			    assert_response :success
			end
            
            def test_create
			    puts "ewqyhrwer"
			    user = users(:one)
			    puts User.all.count
			    @request.headers["Accept"] = "application/json"
			    data = {user: {email: "ffff@gmail.com",first_name: "rrrrrrrrr",password: "12ewd32"}}
			    post :create, {params: data}
                puts "count"
			    puts User.all.count
			    assert_response :success
			end
        
            def test_update
               user = users(:one)
               @request.headers["Accept"] = "application/json"
               data = {user: {email: "efwhj@gmail.com"}, id: user.id}
               put :update, {params: data}
               assert_response :success
            end
		end
	end
end


