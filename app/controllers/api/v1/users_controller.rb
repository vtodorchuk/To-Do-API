class Api::V1::UsersController < ApplicationController
  def create
    result = V1::User::Operation::Create.call(params: params)

    if result.success?
      render json: result[:data], status: :created
    else
      render json: { errors: result[:errors] }, status: :unprocessable_entity
    end
  end
end
