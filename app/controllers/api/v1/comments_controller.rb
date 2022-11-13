class Api::V1::CommentsController < ApplicationController
  before_action :authorize_access_request!

  def index
    task = Task.where(id: params[:task_id]).first
    @comments = task&.comments

    if @comments
      render :index, status: :created
    else
      render status: :not_found
    end
  end

  def create
    @comment = Comment.new(params)

    if @comment&.save
      render :create, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.where(id: params[:comment_id]).first

    if @comment&.destroy
      render status: :ok
    else
      render status: :not_found
    end
  end

  def show
    @comment = Comment.where(id: params[:comment_id]).first

    if @comment
      render :show, status: :ok
    else
      render status: :not_found
    end
  end
end
