require_relative '../../../services/v1/users_service'

class Api::V1::UsersController < ApplicationController
  def create
    user = V1::UsersService.new
    user.call(params)

    render json: user.data, status: user.status
  end
end
