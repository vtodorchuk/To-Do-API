class V1::Task::Operation::Show < Trailblazer::Operation
  step :find_task

  step Policy::Pundit(TaskPolicy, :show?)
  fail :fail_policy

  def find_task(ctx, params:, **)
    ctx[:model] = Task.find_by(id: params[:id])
  end

  def fail_policy(ctx, **)
    ctx[:errors] = ['Unauthorized']
    ctx[:status] = :unauthorized
  end
end
