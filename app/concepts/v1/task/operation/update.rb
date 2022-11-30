class V1::Task::Operation::Update < Trailblazer::Operation
  step :find_task,
       Output(Trailblazer::Activity::Left, :failure) => Path(end_id: 'End.failure', end_task: End(:with_failure)) do
    step :not_found
  end
  step :update_task

  fail :add_errors

  def find_task(ctx, params:, **)
    ctx[:task] = Task.find_by(id: params[:id])
  end

  def update_task(_ctx, task:, params:, **)
    task.update(params)
  end

  def add_errors(ctx, task:, **)
    ctx[:errors] = task.errors.full_messages
    ctx[:status] = :unprocessable_entity
  end

  def not_found(ctx, **)
    ctx[:errors] = [I18n.t('errors.not_found')]
    ctx[:status] = :not_found
  end
end
