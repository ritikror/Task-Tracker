class TimersController < ApplicationController
  before_action :check_administrator, except: [:show]
  before_action :set_params, only: [:show, :update, :destroy, :start_timer]

  def index
    timers = Timer.all
    render json: timers
  end

  def show
    render json: @timer
  end


  def create
    timer = @current_user.timer.new(timer_params)
    if timer.save
      render json: {message: "Timer successfully created", Timer: timer}     
    else
      render json: {message: "something went wrong!!", errors: @current_user.errors.full_messages }
    end
  end

  def update
    if @timer.update(timer_params)
      render json: {message: "Timer successfully updated", Timer: @timer}
    else
      render json: {message: "something went wrong!!", errors: @current_user.errors.full_messages }
    end
  end

  def destroy
    if @timer 
      @timer.destroy
      render json: "Task successfully deleted!!"      
    end
  end

  def start_timer
    time = time_in_minute*60
    Timeout.timeout(time)
  end

  def stop_timer 
  end

  def resume_timer 
  end

  private
  def timer_params
    params.permit(:time_in_minute, :task_id)
  end

  def set_params
      @timer = Timer.find(params[:id])
  end

end
