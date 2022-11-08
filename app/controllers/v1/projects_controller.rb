module V1
  class ProjectsController < ApplicationController
    before_action :authorize_access_request!

    def create
      project = Project.new(name: params[:name])

      if project&.save
        render json: {
          data: { user_id: current_user.id, project_id: project.id }
        }, status: :create
      else
        render json: {
          data: { errors: project.errors.full_messages }
        }, status: :unprocessable_entity
      end
    end

    def destroy
      project = Project.where(id: params[:project_id], user_id: current_user.id).first

      if project&.destroy
        render status: :ok
      else
        render json: {
          data: { errors: project.errors.full_messages }
        }, status: :unprocessable_entity
      end
    end

    def show
      project = Project.where(id: params[:project_id], user_id: current_user.id)

      return render status: :not_found if project.nil?

      render json: { data: { project: project.to_json } }, status: :found
    end

    def update
      project = Project.where(id: params[:project_id], user_id: current_user.id).first

      if project&.update(params)
        render json: { data: { project: project.to_json } }, status: :ok
      else
        render status: :not_found
      end
    end
  end
end
