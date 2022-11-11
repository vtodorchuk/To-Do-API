class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_access_request!

  def index
    @projects = Project.where(id: params[:id], user_id: current_user.id)

    render json: { data: { projects: @projects.to_json } }, status: :found
  end

  def create
    @project = Project.new(name: params[:name])

    if @project&.save
      render :create, status: :created
    else
      render json: { data: { errors: project.errors.full_messages } }, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.where(id: params[:id], user_id: current_user.id).first

    if @project&.destroy
      render status: :ok
    else
      render status: :not_found
    end
  end

  def show
    @project = Project.where(id: params[:id], user_id: current_user.id)

    return render status: :not_found unless @project

    render :show, status: :found
  end

  def update
    @project = Project.where(id: params[:id], user_id: current_user.id).first

    if @project&.update(params)
      render :update, status: :ok
    else
      render status: :not_found
    end
  end
end
