class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  respond_to :json
  private
    def authenticate_user!(options = {})
      if request.headers['Authorization'].present?
        token = request.headers["Authorization"].split(' ').last
        result = JsonWebToken.decode(token)
        @current_user= User.find(result['user_id'])
      else
        reder json: "Missing token"
      end
    end
end