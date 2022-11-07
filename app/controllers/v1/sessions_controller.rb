require_relative '../../services/v1/sessions/sessions_create_service'

module V1
  class SessionsController < ApplicationController
    before_action :authorize_refresh_by_access_header!, only: [:destroy]

    def create
      session = V1::SessionsCreateService.new
      session.call(params)

      render json: session.data, status: session.status
    end

    def destroy
      session = JWTSessions::Session.new(payload: payload)
      session.flush_by_access_payload
      render status: :ok
    end
  end
end
