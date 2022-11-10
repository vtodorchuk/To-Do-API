class Api::V1::CommentsController < ApplicationController
  before_action :authorize_access_request!

  def index
    task = Task.where(id: params[:task_id])
    comments = task&.comments

    if comments
      render json: {
        data: { comments: comments.to_json }
      }, status: :create
    else
      render status: :not_found
    end
  end

  def create
    comment = Comment.new(params)

    if comment&.save
      render json: { data: comment.to_json }, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    comment = Comment.where(id: params[:comment_id])

    if comment&.destroy
      render status: :ok
    else
      render status: :not_found
    end
  end

  def show
    comment = Comment.where(id: params[:comment_id])

    if comment
      render json: { data: comment.to_json }, status: :ok
    else
      render status: :not_found
    end
  end
end
