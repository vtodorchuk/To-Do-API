require_relative '../../services/v1/users/rs/users_create_service'

module V1
  class UsersController < ApplicationController
    def create
      user = V1::UsersCreateService.new
      user.call(permitted_params)

      render json: user.data, status: user.status
    end
  end

  def show
    user = User.find(params[:id])
    render json: { current_user: current_user.to_json, user: user.to_json }
  end

  private

  def permitted_params
    params.permit(%i[email password password_confirmation])
  end
end
