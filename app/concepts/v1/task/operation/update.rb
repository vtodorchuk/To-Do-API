class V1::Task::Operation::Update < Trailblazer::Operation
  step :find_project, fail_fast: true
  step :find_task, fail_fast: true
  step :update_task

  fail :add_errors

  def find_project(ctx, current_user:, project_id:, **)
    ctx[:project] = current_user.projects.find_by(id: project_id)
  end

  def find_task(ctx, project:, params:, **)
    ctx[:task] = project.tasks.find_by(id: params[:id])
  end

  def update_task(_ctx, task:, params:, **)
    task.update(params)
  end

  def add_errors(ctx, task:, **)
    ctx[:errors] = task.errors.full_messages
  end
end
