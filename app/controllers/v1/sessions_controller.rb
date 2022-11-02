module V1
  class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])

      if user&.valid_password?(params[:password])
        render json: {
          data: {
            user: { id: user.id, authentication_token: user.authentication_token },
            message: I18n.t('session.sing_in.message.success')
          }
        }, status: :created
      else
        render json: {
          data: {
            message: I18n.t('session.sing_in.message.errors.email')
          }
        }, status: :unauthorized
      end
    end

    def destroy
      current_user = User.where(id: params[:id], authentication_token: params[:authentication_token]).first

      if current_user&.update(authentication_token: nil)
        render json: {
          data: {
            message: I18n.t('session.sign_out.message.success')
          }
        }, status: :ok
      else
        render status: :not_found
      end
    end
  end
end
