module V1
  class SessionCreateService < V1::Service
    def call(params)
      user = User.find_by(email: params[:email])

      if user&.valid_password?(params[:password])
        tokens = generate_session(user.id)

        @data = { data: {
          session: { user_id: user.id, csrf: tokens[:csrf] },
          message: I18n.t('session.sing_in.message.success')
        } }
        @status = :created
      else
        @data = { message: I18n.t('session.sing_in.message.errors.email') }
        @status = :unauthorized
      end
    end

    private

    def generate_session(user_id)
      payload = { user_id: user_id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      session.login
    end
  end
end
