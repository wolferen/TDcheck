class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]
  before_filter :check_user, only: [:show, :edit]

  def index
    if user_signed_in?
      @search = Task.search(params[:q])
      @tasks = @search.result.where(:user_id => current_user.id).order('created_at DESC')
    end
  end

  def new
    unless current_user
      redirect_to new_user_session_path, notice: "You must be logged in to access this section"
    else
      @task = current_user.tasks.build
    end
  end

  def show
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
     redirect_to root_path
    else
     render 'new'
    end
  end

  def update
    if @task.update(task_params)
     redirect_to root_path
    else
     render 'edit'
    end
  end

  def destroy
   @task.destroy
  end

  def complete
		@task = Task.find(params[:id])
		@task.update_attribute(:completed_at, Time.now)
		redirect_to root_path, notice: 'Task successfully completed!'
	end

	private

	def task_params
		params.require(:task).permit(:title, :priority, :deadline, :started_at)
	end

	def find_task
		@task = Task.find(params[:id])
	end
end
