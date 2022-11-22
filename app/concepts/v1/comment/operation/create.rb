class V1::Comment::Operation::Create < Trailblazer::Operation
  step :find_task
  step :initialize_comment
  step :save_comment

  fail :add_errors

  def find_task(ctx, params:, **)
    ctx[:task] = Task.find_by(id: params[:task_id])
  end

  def initialize_comment(ctx, task:, comment_params:, **)
    ctx[:comment] = task.comments.new(comment_params)
  end

  def save_comment(_ctx, comment:, **)
    comment.save
  end

  def add_errors(ctx, **)
    if ctx[:comment]
      ctx[:errors] = ctx[:comment].errors.full_messages
      ctx[:status] = :unprocessable_entity
    else
      ctx[:errors] = ['Not Found']
      ctx[:status] = :not_found
    end
  end
end
