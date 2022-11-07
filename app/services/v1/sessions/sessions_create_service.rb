module V1
  class SessionsCreateService < V1::Service
    def call(params)
      user = User.find_by(email: params[:email])

      if user&.valid_password?(params[:password])
        payload = { user_id: user.id }
        session = JWTSessions::Session.new(payload: payload)

        @data = { data: session.login }
        @status = :created
      else
        @data = { message: I18n.t('session.sing_in.message.errors.email') }
        @status = :unauthorized
      end
    end
  end
end

