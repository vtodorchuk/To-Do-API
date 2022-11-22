class V1::Comment::Operation::Destroy < Trailblazer::Operation
  step :find_project
  step :find_task
  step :find_comment
  step :destroy_comment

  fail :add_errors

  def find_project(ctx, current_user:, params:, **)
    ctx[:project] = current_user.projects.find_by(id: params[:project_id])
  end

  def find_task(ctx, project:, params:, **)
    ctx[:task] = project.tasks.find_by(id: params[:task_id])
  end

  def find_comment(ctx, task:, params:, **)
    ctx[:comment] = task.comments.find_by(id: params[:id])
  end

  def destroy_comment(_ctx, comment:, **)
    comment.destroy
  end

  def add_errors(ctx, **)
    ctx[:errors] = ['Not Found']
    ctx[:status] = :not_found
  end
end
