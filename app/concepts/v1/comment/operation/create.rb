class V1::Comment::Operation::Create < Trailblazer::Operation
  step :find_task,
       Output(Trailblazer::Activity::Left, :failure) => Path(end_id: 'End.failure', end_task: End(:with_failure)) do
    step :not_found
  end
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

  def add_errors(ctx, comment:, **)
    ctx[:errors] = comment.errors.full_messages
    ctx[:status] = :unprocessable_entity
  end

  def not_found(ctx, **)
    ctx[:errors] = [I18n.t('errors.not_found')]
    ctx[:status] = :not_found
  end
end
