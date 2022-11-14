require_relative '../v1/service'

module V1
  class SessionsService < V1::Service
    def call(params)
      user = User.find_by(email: params[:email])

      if user&.valid_password?(params[:password])
        payload = { user_id: user.id }
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)

        @data = { user_id: user.id, session: session.login }
        @status = :created
      else
        @status = :unauthorized
      end
    end
  end
end
