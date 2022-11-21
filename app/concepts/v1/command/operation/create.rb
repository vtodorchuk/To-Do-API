class V1::Command::Operation::Create < Trailblazer::Operation
  step :find_project, fail_fast: true
  step :find_task, fail_fast: true
  step :initialize_comment
  step :save_comment

  fail :add_errors

  def find_project(ctx, current_user:, project_id:, **)
    ctx[:project] = current_user.projects.find_by(id: project_id)
  end

  def find_task(ctx, project:, params:, **)
    ctx[:task] = project.tasks.find_by(id: params[:task_id])
  end

  def initialize_comment(ctx, task:, params:, **)
    ctx[:comment] = task.comments.new(params)
  end

  def save_comment(ctx, comment:, **)
    comment.save
  end

  def add_errors(ctx, comment:, **)
    ctx[:errors] = comment.errors.full_messages
  end
end
