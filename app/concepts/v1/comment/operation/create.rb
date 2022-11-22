class V1::Comment::Operation::Create < Trailblazer::Operation
  step :find_project
  step :find_task
  step :initialize_comment
  step :save_comment

  fail :add_errors

  def find_project(ctx, current_user:, params:, **)
    ctx[:project] = current_user.projects.find_by(id: params[:project_id])
  end

  def find_task(ctx, project:, params:, **)
    ctx[:task] = project.tasks.find_by(id: params[:task_id])
  end

  def initialize_comment(ctx, task:, comment_params:, **)
    ctx[:comment] = task.comments.new(comment_params)
  end

  def save_comment(_ctx, comment:, **)
    comment.save
  end

  def add_errors(ctx, **)
    if ctx[:comment]
      ctx[:errors] = ctx[:comment].errors.full_messages
      ctx[:status] = :unprocessable_entity
    else
      ctx[:errors] = ['Not Found']
      ctx[:status] = :not_found
    end
  end
end
