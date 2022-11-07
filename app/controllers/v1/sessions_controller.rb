require_relative '../../services/v1/sessions/sessions_create_service'

module V1
  class SessionsController < ApplicationController
    before_action :authorize_access_request!, only: [:destroy]
    before_action :authorize_refresh_request!, only: [:destroy_by_refresh]

    def create
      session = V1::SessionsCreateService.new
      session.call(params)

      render json: session.data, status: session.status
    end

    def destroy
      session = JWTSessions::Session.new(payload: payload)
      session.flush_by_access_payload
      render json: :ok
    end

    def destroy_by_refresh
      session = JWTSessions::Session.new(payload: payload)
      session.flush_by_token(found_token)
      render json: :ok
    end
  end
end
