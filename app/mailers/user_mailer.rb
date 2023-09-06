class UserMailer < ApplicationMailer
  # default from: 'ritikd@shriffle.com'

  # def welcome_email
  #   @user = params[:user]
  #   @url  = 'https://accounts.google.com/v3/signin/identifier?hl=en-GB&ifkv=AXo7B7XvZZyi8xh2h84pI01zOGHsQnnU0PJp6EndJZ5LO_i524kaiex_UfYdjNPo6ZLXL86Kdy3RjQ&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S218520285%3A1693915115398053&theme=glif'
  #   mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  # end

  def welcome_email
    @user = params[:user]

    mail(to: @user.email, subject: "Welcome to Our Awesome Site")
  end
end
