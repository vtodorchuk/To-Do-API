class V1::Task::Operation::Update < Trailblazer::Operation
  step :find_task
  step :update_task

  fail :add_errors

  def find_task(ctx, params:, **)
    ctx[:task] = Task.find_by(id: params[:id])
  end

  def update_task(_ctx, task:, params:, **)
    task.update(params)
  end

  def add_errors(ctx, **)
    if ctx[:task]
      ctx[:errors] = ctx[:task].errors.full_messages
      ctx[:status] = :unprocessable_entity
    else
      ctx[:errors] = ['Not Found']
      ctx[:status] = :not_found
    end
  end
end
