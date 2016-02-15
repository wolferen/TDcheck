class TasksController < ApplicationController
before_action :find_task, only: [:show, :edit, :update, :destroy]

	def new
		@task = Task.new
	end

	def show
	end

	def index
		@tasks = Task.all.order('Created_at DESC')
	end

	def create 
		@task = Task.new(task_params)
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
		params.require(:task).permit(:title, :priority)
	end

	def find_task
			@task = Task.find(params[:id])
	end

end
