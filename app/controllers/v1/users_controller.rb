require_relative '../../services/v1/user_service'

module V1
  class UsersController < ApplicationController
    before_action :check_user_for_sing_up

    def create
      user = User.new(permited_params)

      if user.save
        render json: {
          data: {
            user: { id: user.id, email: user.email },
            message: I18n.t('session.sing_up.message.success')
          }
        }, status: :created
      else
        render json: user.errors.messages.to_json, status: :conflict
      end
    end
  end

  private

  def check_user_for_sing_up
    unless UserService.check_user_email(permited_params[:email])
      return render json: I18n.t('session.sing_up.message.errors.email').to_json,
                    status: :not_found
    end

    unless UserService.check_password(permited_params[:password],
                                      permited_params[:password_confirmation])
      render json: I18n.t('session.sing_up.message.errors.password').to_json,
             status: :not_found
    end
  end

  def permited_params
    params.permit(:email, :password, :password_confirmation)
  end
end
