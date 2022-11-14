require_relative '../../../services/v1/sessions_service'

class Api::V1::SessionsController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]
  before_action :authorize_refresh_request!, only: [:destroy_by_refresh]

  def create
    session = V1::SessionsService.new
    session.call(params)

    render json: session.data, status: session.status
  end

  def destroy
    session = JWTSessions::Session.new(refresh_by_access_allowed: true, payload: payload)
    session.flush_by_access_payload
    render status: :ok
  end

  def destroy_by_refresh
    session = JWTSessions::Session.new(refresh_by_access_allowed: true, payload: payload)
    session.flush_by_access_payload
    render status: :ok
  end
end
