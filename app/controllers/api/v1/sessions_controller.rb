class Api::V1::SessionsController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]

  def create
    result = V1::Session::Operation::Create.call(params: params)

    if result.success?
      render json: result[:data], status: :created
    else
      render json: {}, status: :unauthorized
    end
  end

  def destroy
    result = V1::Session::Operation::Destroy.call(payload: payload)

    return render status: :ok if result.success?

    render status: :not_found
  end
end
