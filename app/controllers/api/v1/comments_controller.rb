class Api::V1::CommentsController < ApplicationController
  before_action :authorize_access_request!

  def index
    @comments = task&.comments&.order(created_at: :desc)

    if @comments
      render json: @comments.to_json(only: %i[id body task_id]), status: :found
    else
      render status: :not_found
    end
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment&.save
      render json: @comment.to_json(only: %i[id body task_id]), status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = comment

    if @comment&.destroy
      render status: :ok
    else
      render status: :not_found
    end
  end

  def show
    @comment = comment

    if @comment
      render json: @comment.to_json(only: %i[id body task_id]), status: :found
    else
      render status: :not_found
    end
  end

  private

  def comment_params
    params.permit(:body, :task_id)
  end

  def task
    Task.find_by(id: params[:task_id], project_id: params[:project_id])
  end

  def comment
    task.comments.find_by(id: params[:id])
  end
end
