
module V1
  class ProjectsController < ApplicationController
    before_action :authorize_access_request!, only: [:destroy]

    def create
      project = Project.new(name: params[:name])

      if project.save
        render json: {
          data: { user_id: current_user.id, project_id: project.id
          } }, status: :create
      else
        render json: {
          data: { errors: project.errors.messages
          } }, status: :unprocessable_entity
      end
    end

    def destroy
      project = Project.where(id: params[:project_id], user_id: current_user.id)

      if project&.destroy
        render json: {
          data: { message: I18n.t('project.messages.successful.destroy')
          } }, status: :ok
      else
        render json: {
          data: { errors: project.errors.messages
          } }, status: :unprocessable_entity
      end
    end

    def show
      project = Project.where(id: params[:project_id], user_id: current_user.id)

      return render status: :not_found if project.nil?

      render json: { data: { project: project.to_json } }, status: :found
    end
  end
end
