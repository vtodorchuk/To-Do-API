class V1::Comment::Operation::Index < Trailblazer::Operation
  step Policy::Pundit(CommentPolicy, :index?)
  fail :fail_policy, fail_fast: true

  step :find_task, fail_fast: true
  step :find_comment

  def find_task(ctx, params:, **)
    ctx[:task] = Task.find_by(id: params[:task_id])
  end

  def find_comment(ctx, task:, params:, **)
    ctx[:comment] = task.comments.order(created_at: :desc).page(params[:page])
  end

  def fail_policy(ctx, **)
    ctx[:errors] = ['Unauthorized']
    ctx[:status] = :unauthorized
  end
end
