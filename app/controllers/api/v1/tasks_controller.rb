class Api::V1::TasksController < ApplicationController
  
  before_action :authenticate_with_token!

  def index
    if tasks.invisible
      tasks = current_user.task
      render json: { tasks: tasks }, status: 200
    else
      tasks = Task.all
      render json: { tasks: tasks }, status: 200
    end
    
    completed_task = current_user.tasks.completed
    #@complete_task = current_user.tasks.where(status: true)
    incomplete_task = current_user.tasks.incomplete
    #@incomplete_task = current_user.tasks.where(status: false)
    visible_task = current_user.tasks.visible
    #@visible_task = current_user.tasks.where(visibility: true)
    invisible_task = current_user.invisible
    #@invisible_task = current_user.tasks.where(visibility: false)
    
    #tasks.visible = Task.all
		#tasks.invisible = current_user.tasks
		#render json: { tasks: tasks }, status: 200
  end

  def show
    task = current_user.tasks.find(params[:id])
    render json: task, status: 200
  end

  def create
    task = current_user.tasks.build(task_params)

    if task.save
      render json: task, status: 201
    else
      render json: { errors: task.errors }, status: 422
    end
  end

  def update
    task = current_user.tasks.find(params[:id])

    if task.update_attributes(task_params)
      render json: task, status: 200
    else
      render json: { errors: task.errors }, status: 422
    end
  end

  def destroy
    task = current_user.tasks.find(params[:id])
    task.destroy
    head 204
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, :visibility, :user_id)
  end
end
