require_relative '../../services/v1/users/users_create_service'

module V1
  class UsersController < ApplicationController
    def create
      user = V1::UsersCreateService.new
      user.call(params)

      render json: user.data, status: user.status
    end
  end

  private

  def permitted_params
    params.permit(%i[email password password_confirmation])
  end
end

