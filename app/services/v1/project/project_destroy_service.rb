module V1
  class ProjectDestroyService < V1::Service
    def call(params)
      project = Project.where(if: params[:project_id])

      if project_exist?
        destroy(project)
      else
        @data = { data: {
          message: I18n.t('projects.messages.errors.not_found')
        } }
        @status = :not_found
      end
    end

    private

    def project_exist?(project_id)
      project = Project.where(id: project_id)

      project.nil?
    end

    def destroy(project)
      if project.destroy
        @data = { data: {
          message: I18n.t('projects.messages.success.destroy')
        } }
        @status = :ok
      else
        @data = { data: {
          message: project.errors.messages
        } }
        @status = :unprocessable_entity
      end
    end
  end
end
