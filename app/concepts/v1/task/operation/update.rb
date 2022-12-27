class V1::Task::Operation::Update < Trailblazer::Operation
  step :find_task
  fail :not_found, fail_fast: true
  step :update_task

  fail :add_errors

  def find_task(ctx, params:, **)
    ctx[:task] = Task.find_by(id: params[:id])
  end

  def not_found(ctx, **)
    ctx[:errors] = [I18n.t('errors.not_found')]
    ctx[:status] = :not_found
  end

  def update_task(_ctx, task:, params:, **)
    task.update(params)
  end

  def add_errors(ctx, task:, **)
    ctx[:errors] = task.errors.full_messages
    ctx[:status] = :unprocessable_entity
  end
end
