class TimerMailer < ApplicationMailer
    def timer_complete
        timer = params[:timer]
        data = Task.find(timer.task_id)
        @user= User.find(data.assign_to)   
        mail(to: @user.email, subject: "Task status updated!!!")
      end
end
