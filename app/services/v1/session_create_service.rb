module V1
  class SessionCreateService
    attr_reader :data, :status

    def call(params)
      user = User.find_by(email: params[:email])

      if user&.valid_password?(params[:password])
        @data = { data: {
            user: { id: user.id, authentication_token: user.authentication_token },
            message: I18n.t('session.sing_in.message.success')
          } }
        @status = :created
      else
        @data =  { data: {
            message: I18n.t('session.sing_in.message.errors.email')
          } }
        @status = :unauthorized
      end
    end
  end
end
