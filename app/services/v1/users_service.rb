module V1
  class UsersService < V1::Service
    def call(params)
      user = User.new(email: params[:email], password: params[:password])

      message = validate?(user, params)
      if message
        @data = { data: { errors: message } }
        @status = :unprocessable_entity
      else
        create_user(user)
      end
    end

    private

    def create_user(user)
      if user.save
        payload = { user_id: user.id }
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
        tokens = session.login

        @data = { data: {
          user: { access: tokens[:access], csrf: tokens[:csrf] }
        } }
        @status = :created
      else
        @data = { data: { errors: user.errors.messages } }
        @status = :unprocessable_entity
      end
    end

    def validate?(user, params)
      return I18n.t('session.sing_up.message.errors.email') if user_exists?(params[:email])

      I18n.t('session.sing_up.message.errors.password') unless user.valid_password?(params[:password_confirmation])
    end

    def user_exists?(email)
      user = User.find_by(email: email)
      return true if user

      false
    end
  end
end
