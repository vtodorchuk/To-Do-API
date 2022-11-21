class V1::Task::Operation::Create < Trailblazer::Operation
  step :find_project, fail_fast: true
  step :initialize_task
  step :save_task

  fail :add_errors

  def find_project(ctx, current_user:, project_id:, **)
    ctx[:project] = current_user.projects.find_by(id: project_id)
  end

  def initialize_task(ctx, project:, params:, **)
    ctx[:task] = project.tasks.new(params)
  end

  def save_task(_ctx, task:, **)
    task.save
  end

  def add_errors(ctx, task:, **)
    ctx[:errors] = task.errors.full_messages
  end
end
