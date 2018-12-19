# class ApplicationController < ActionController::API
# 	include ActionController::MimeResponds
# 	respond_to :json


#    private

# 	def authenticate_user!(options = {})
# 		if request.headers['Authorization'].present?
# 			token = request.headers["Authorization"].split(' ').last
# 		    result = JsonWebToken.decode(token)
# 		    current_user= User.find(result['user_id'])
# 		else
# 			reder json: "Missing token"
# 		end
# 	end

# 	def current_user
# 		puts "hello how are you"
# 		# if request.headers['Authorization'].present?
# 		# 	token = request.headers["Authorization"].split(' ').last
# 		#     result = JsonWebToken.decode(token)
# 		#     current_user= User.find(result['user_id'])
# 		# else
# 		# 	render json: 'Missing toke'
# 		# end
# 	end
# end


class ApplicationController < ActionController::API
	include ActionController::MimeResponds
	respond_to :json
 # before_action :authenticate_request
 #  attr_reader :current_user

 #  private

 #  def authenticate_request
 #    @current_user = AuthorizeApiRequest.call(request.headers).result
 #    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
 #  end
end