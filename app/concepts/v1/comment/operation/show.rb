class V1::Comment::Operation::Show < Trailblazer::Operation
  step :find_comment

  step Policy::Pundit(TaskPolicy, :show?)
  fail :fail_policy

  def find_comment(ctx, params:, **)
    ctx[:model] = Comment.find_by(id: params[:id])
  end

  def fail_policy(ctx, **)
    ctx[:errors] = ['Unauthorized']
    ctx[:status] = :unauthorized
  end
end
