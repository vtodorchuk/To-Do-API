require_relative '../../../services/v1/sessions_service'

class Api::V1::SessionsController < ApplicationController
  before_action :authorize_access_request!, only: [:destroy]

  def create
    session = V1::SessionsService.new
    session.call(params)

    render json: session.data, status: session.status
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: :ok
  end
end
