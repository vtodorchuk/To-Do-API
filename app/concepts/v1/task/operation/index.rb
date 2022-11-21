class V1::Task::Operation::Index < Trailblazer::Operation
  step :find_project
  step :show_tasks

  def find_project(ctx, current_user:, params:, **)
    ctx[:project] = current_user.projects.find_by(id: params[:project_id])
  end

  def show_tasks(ctx, project:, **)
    ctx[:tasks] = project.tasks.order(position: :desc)
  end
end
