module V1
  class UsersService < V1::Service
    def call(params)
      user = User.new(email: params[:email], password: params[:password])

      message = validate_message(user, params)

      if message
        @data = { message: message }
        @status = :unprocessable_entity
      else
        create_user(user)
      end
    end

    private

    def create_user(user)
      if user.save
        payload = { user_id: user_id }
        session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
        tokens = session.login

        @data = { data: {
          user: { access: tokens[:access], csrf: tokens[:csrf] }
        } }
        @status = :created
      else
        @data = { errors: user.errors.messages }
        @status = :unprocessable_entity
      end
    end

    def validate_message(user, params)
      return false if user_exists?(params[:email])

      false unless confirmed_password?(user, params[:password_confirmation])

      true
    end

    def user_exists?(email)
      user = User.find_by(email: email)
      return true if user

      false
    end

    def confirmed_password?(user, password_confirmation)
      user.valid_password?(password_confirmation)
    end
  end
end
