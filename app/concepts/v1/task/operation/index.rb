class V1::Task::Operation::Index < Trailblazer::Operation
  step Policy::Pundit(TaskPolicy, :index?)
  fail :fail_policy, fail_fast: true

  step :find_project
  step :show_tasks

  def fail_policy(ctx, **)
    ctx[:errors] = ['Unauthorized']
    ctx[:status] = :unauthorized
  end

  def find_project(ctx, current_user:, params:, **)
    ctx[:project] = current_user.projects.find_by(id: params[:project_id])
  end

  def show_tasks(ctx, project:, params:, **)
    ctx[:tasks] = project.tasks.order(position: :desc).page(params[:page])
  end
end
