class V1::Command::Operation::Index < Trailblazer::Operation
  step :find_project, fail_fast: true
  step :find_task, fail_fast: true
  step :find_comment

  def find_project(ctx, current_user:, project_id:, **)
    ctx[:project] = current_user.projects.find_by(id: project_id)
  end

  def find_task(ctx, project:, params:, **)
    ctx[:task] = project.tasks.find_by(id: params[:task_id])
  end

  def find_comment(ctx, task:, params:, **)
    ctx[:comment] = task.comments
  end
end
