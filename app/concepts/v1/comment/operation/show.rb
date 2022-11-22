class V1::Comment::Operation::Show < Trailblazer::Operation
  step :find_comment

  def find_comment(ctx, params:, **)
    ctx[:comment] = Comment.find_by(id: params[:id])
  end
end
