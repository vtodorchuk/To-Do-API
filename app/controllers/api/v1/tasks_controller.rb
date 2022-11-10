class Api::V1::TasksController < ApplicationController
  before_action :authorize_access_request!

  def index
    project = current_user.projects(params[:project_id])
    tasks = project.tasks

    if tasks
      render json: {
        data: { tasks: tasks.to_json }
      }, status: :create
    else
      render status: :not_found
    end
  end

  def create
    project = current_user.projects(params[:project_id])
    task = project.tasks.new(params)

    if task.save
      render json: {
        data: { task: task.to_json }
      }, status: :create
    else
      render json: {
        data: { errors: task.errors.full_messages }
      }, status: :unprocessable_entity
    end
  end

  def destroy
    task = Task.where(id: params[:task_id]).first

    if task&.destroy
      render status: :ok
    else
      render json: {
        data: { errors: task.errors.full_messages }
      }, status: :unprocessable_entity
    end
  end

  def update
    task = Task.where(id: params[:task_id]).first

    if task&.update(params[:task])
      render status: :ok
    else
      render json: {
        data: { errors: task.errors.full_messages }
      }, status: :unprocessable_entity
    end
  end

  def show
    task = Task.where(id: params[:task_id]).first

    return render status: :not_found if task.nil?

    render json: { data: { project: task.to_json } }, status: :found
  end
end
