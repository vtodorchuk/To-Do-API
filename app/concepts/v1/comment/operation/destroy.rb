class V1::Comment::Operation::Destroy < Trailblazer::Operation
  step :find_comment
  step :destroy_comment

  fail :add_errors

  def find_comment(ctx, params:, **)
    ctx[:comment] = Comment.find_by(id: params[:id])
  end

  def destroy_comment(_ctx, comment:, **)
    comment.destroy
  end

  def add_errors(ctx, **)
    ctx[:errors] = ['Not Found']
    ctx[:status] = :not_found
  end
end
