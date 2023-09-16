class TasksController < ApplicationController
  before_action :set_params, except: [:index, :create, :new]
  before_action :check_administrator, except: [:index, :show]

  def index
    if current_user.type == "Administrator"
      @tasks = current_user.tasks.page params[:page]
    else
      @tasks = Task.where(assign_to:current_user.id).page params[:page]
    end
  end

  def show
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
      TaskMailer.with(task: @task).task_assigned.deliver_now   
    else
      redirect_to new_task_path
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'   
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to tasks_path, notice: 'Task was successfully deleted.'
    else
      redirect_to @task,  notice: 'Something Went Wrong!!!!.'
    end
  end
  

  private
  def task_params
    params.require(:task).permit(:title, :description, :assign_to, :status, timer_attributes: [:time_in_minute, :task_id, :user_id])
  end

  def set_params
    # @task = Task.find(params[:id])
    if current_user.type == "Administrator"
      @task = current_user.tasks.find(params[:id])
      @timer = @task.timer
    else
      assign_task = Task.where(assign_to:current_user.id)
      @task = assign_task.find(params[:id])
      @timer = @task.timer
    end
  end
end
