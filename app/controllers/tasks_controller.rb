class TasksController < ApplicationController
before_action :find_task, only: [:show, :edit, :update, :destroy]

	def index
		if user_signed_in?
			@search = Task.search(params[:q])
			@tasks = @search.result.where(:user_id => current_user.id).order('created_at DESC')
		end
		# if user_signed_in?
		# 	@tasks = Task.where(:user_id => current_user.id).order('created_at DESC')
		# end
	end

	def new
		@task = current_user.tasks.build
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
		redirect_to root_path
	end

	def complete
		@task = Task.find(params[:id])
		@task.update_attribute(:completed_at, Time.now)
		redirect_to root_path, notice: "Task successfully completed!"
	end

	private 

	def task_params
		params.require(:task).permit(:title, :priority, :deadline, :started_at)
	end

	def find_task
			@task = Task.find(params[:id])
	end

end
