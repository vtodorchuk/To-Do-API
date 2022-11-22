class V1::Comment::Operation::Index < Trailblazer::Operation
  step :find_project, fail_fast: true
  step :find_task, fail_fast: true
  step :find_comment

  def find_project(ctx, current_user:, params:, **)
    ctx[:project] = current_user.projects.find_by(id: params[:project_id])
  end

  def find_task(ctx, project:, params:, **)
    ctx[:task] = project.tasks.find_by(id: params[:task_id])
  end

  def find_comment(ctx, task:, **)
    ctx[:comment] = task.comments.order(created_at: :desc)
  end
end
