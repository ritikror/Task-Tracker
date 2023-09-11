class TimerMailer < ApplicationMailer
    def timer_complete
        @user= User.find(params[:timer]&.task&.assign_to)
        mail(to: @user.email, subject: "Task status updated!!!")
      end
end
