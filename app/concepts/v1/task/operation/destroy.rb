class V1::Task::Operation::Destroy < Trailblazer::Operation
  step :find_task
  step :destroy_task

  def find_task(ctx, params:, **)
    ctx[:task] = Task.find_by(id: params[:id])
  end

  def destroy_task(_ctx, task:, **)
    task.destroy
  end
end
