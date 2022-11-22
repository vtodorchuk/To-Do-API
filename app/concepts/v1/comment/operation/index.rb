class V1::Comment::Operation::Index < Trailblazer::Operation
  step :find_task, fail_fast: true
  step :find_comment

  def find_task(ctx, params:, **)
    ctx[:task] = Task.find_by(id: params[:task_id])
  end

  def find_comment(ctx, task:, **)
    ctx[:comment] = task.comments.order(created_at: :desc)
  end
end
