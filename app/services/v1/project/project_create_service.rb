module V1
  class ProjectCreateService < V1::Service
    def call(params)
      project = Project.new(params)

      if project.save
        @data = { data: {
          project: { id: project.id, name: project.name },
          message: I18n.t('projects.messages.success.create')
        } }
        @status = :created
      else
        @data = { data: {
          message: project.errors.messages
        } }
        @status = :unprocessable_entity
      end
    end
  end
end
