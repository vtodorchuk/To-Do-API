require_relative '../../services/v1/project/project_create_service'
require_relative '../../services/v1/project/project_destroy_service'

module V1
  class ProjectsController < V1::Service
    def create
      project = V1::ProjectCreateService.new
      project.call(params)

      render json: project.data, status: project.status
    end

    def destroy
      project = V1::ProjectDestroyService.new
      project.call(params)

      render json: project.data, status: project.status
    end
  end
end
