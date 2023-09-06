class UsersController < ApplicationController
  skip_before_action :authenticate_request, only: [:create, :login]
  before_action :check_administrator, only: :destroy

  def show
    render json: @current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_later  
      render json: { message:"User Created!!!", data: @user }
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    if @current_user.update(user_params)
      render json: { message: 'User updated', data: @current_user}
    else
      render json: { errors: @current_user.errors.full_messages }
    end
  end

  def destroy
    if @current_user.destroy
      render json: { message: 'User deleted' }
    else
      render json: { errors: @current_user.errors.full_messages }
    end
  end
  

  def login
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      token = jwt_encode(user_id: user.id)
      render json: { message: "Logged In Successfully..", token: token }
    else
      render json: { error: "Please Check your Email And Password....."}  
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :type)
  end
end
