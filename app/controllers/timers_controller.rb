class TimersController < ApplicationController
  before_action :check_administrator, except: [:show, :start_timer]
  before_action :check_workie, only: :start_timer
  before_action :set_params, except: [:index, :create]

  def show
  end

  def start_timer
    render 'start_timer'
    task = Task.find(@timer.task_id)
    if task.assign_to == current_user.id
      if task.status != "Complete"
        t = @timer.time_in_minute * 60
        t.times do |i|
          puts "Timer is running....#{i} second"
          sleep(1)
        end

        task = task.update(status: "Complete")
        if task
          TimerMailer.with(timer: @timer).timer_complete.deliver_now
        else
          redirect_to tasks_path, notice: "Task time is completed, but there was an issue."
        end
      end
    else
      redirect_to @timer, notice: "#{User.find(task.assign_to).name} can only start the timer!!"
    end
  end

private
  def set_params
      @timer = Timer.find(params[:id])
  end

end
