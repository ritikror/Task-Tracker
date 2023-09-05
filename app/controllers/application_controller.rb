class ApplicationController < ActionController::API
  include JsonWebToken
  before_action :authenticate_request

  private
	def authenticate_request
		begin
			header = request.headers[ 'Authorization' ]
			header = header.split(" ").last if header
			decoded = jwt_decode(header)
			@current_user = User.find(decoded[:user_id])
		rescue JWT::DecodeError	=> e
			render json: { error: 'Invalid token' }, status: :unprocessable_entity
		end
	end
	
	def current_user
		@current_user
	end

  	def check_administrator
		return render json: { message: "You don't have access to perform this action. Please contact to your administrator" } unless @current_user.type == 'Administrator'
	end

	rescue_from ActiveRecord::RecordNotFound, with: :handle_exception
	def handle_exception
		render json: { error: 'Wrong input!!!' }
	end	
end
