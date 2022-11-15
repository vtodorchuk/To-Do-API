class Api::V1::TasksController < ApplicationController
  before_action :authorize_access_request!

  def index
    @tasks = project&.tasks&.order(position: :desc)

    if @tasks
      render json: @tasks.to_json(only: %i[id title deadline position completed project_id]), status: :found
    else
      render status: :not_found
    end
  end

  def create
    @task = Task.new(task_params)

    if @task&.save
      render json: @task.to_json(only: %i[id title deadline position completed project_id]), status: :created
    else
      render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @task = task

    if @task&.destroy
      render status: :ok
    else
      render status: :not_found
    end
  end

  def update
    @task = task

    if @task&.update(task_params)
      render json: @task.to_json(only: %i[id title deadline position completed project_id]), status: :ok
    else
      return render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity if @task

      render status: :not_found
    end
  end

  def show
    @task = task

    if @task
      render json: @task.to_json(only: %i[id title deadline position completed project_id]), status: :found
    else
      render status: :not_found
    end
  end

  private

  def task_params
    params.permit(:title, :position, :deadline, :completed, :project_id)
  end

  def project
    current_user.projects.find_by(id: params[:project_id])
  end

  def task
    Task.find_by(id: params[:id], project_id: params[:project_id])
  end
end
