module V1
  class UsersCreateService < V1::Service
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
        @data = { data: {
          user: { id: user.id, email: user.email },
          message: I18n.t('session.sing_up.message.success')
        } }
        @status = :created
      else
        @data = { message: I18n.t('session.sing_up.message.errors.error'),
                  errors: user.errors.messages }
        @status = :unprocessable_entity
      end
    end

    def validate_message(user, params)
      return I18n.t('session.sing_up.message.errors.email') if user_exists?(params[:email])

      I18n.t('session.sing_up.message.errors.password') unless confirmed_password?(user, params[:password_confirmation])
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

