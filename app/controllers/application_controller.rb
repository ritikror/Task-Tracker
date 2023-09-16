class ApplicationController < ActionController::Base
  include JsonWebToken
#   before_action :authenticate_request
  protect_from_forgery prepend: true
  before_action :authenticate_user!
  before_action :current_user, except: [:sign_in, :sign_up]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :type , :password])
  end


  def check_administrator
  	return render json: { message: "You don't have access to perform this action. Please contact to your administrator" } unless @current_user.type == 'Administrator'
  end
  
  def check_workie
  	return render json: { message: "Hey this action is reserved for Workie only!!!!" } unless @current_user.type == 'Workie'
  end	

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  def not_found
  	render 'not_found', notice: 'No record found'
  end	
end
