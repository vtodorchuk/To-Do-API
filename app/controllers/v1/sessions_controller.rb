require_relative '../../services/v1/session_create_service'

module V1
  class SessionsController < ApplicationController
    def create
      session = V1::SessionCreateService.new
      session.call(params)

      render json: session.data, status: session.status
    end

    def destroy
      # TODO: Destroy access_token and refresh for this user
    end
  end
end
