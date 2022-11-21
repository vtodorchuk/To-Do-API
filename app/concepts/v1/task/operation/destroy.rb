class V1::Task::Operation::Destroy < Trailblazer::Operation
  step :find_project, fail_fast: true
  step :find_task
  step :destroy_task

  def find_project(ctx, current_user:, project_id:, **)
    ctx[:project] = current_user.projects.find_by(id: project_id)
  end

  def find_task(ctx, project:, params:, **)
    ctx[:task] = project.tasks.find_by(id: params[:id])
  end

  def destroy_task(_ctx, task:, **)
    task.destroy
  end
end
