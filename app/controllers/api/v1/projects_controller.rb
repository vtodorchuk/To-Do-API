class Api::V1::ProjectsController < ApplicationController
  before_action :authorize_access_request!
  def index
    @projects = Project.where(user_id: current_user.id)

    render json: @projects.to_json(only: %i[id name user_id]), status: :found
  end

  def create
    @project = Project.new(name: params[:name], user_id: current_user.id)

    if @project&.save
      render json: @project.to_json(only: %i[id name user_id]), status: :created
    else
      render json: { errors: @project.errors.full_messages }, status: :unprocessable_entity
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
    @project = Project.where(id: params[:id], user_id: current_user.id).first

    if @project
      render json: @project.to_json(only: %i[id name user_id]), status: :found
    else
      render status: :not_found
    end
  end

  def update
    @project = Project.where(id: params[:id], user_id: current_user.id).first

    if @project&.update(name: params[:name])
      render json: @project.to_json(only: %i[id name user_id]), status: :ok
    else
      render status: :not_found
    end
  end
end
