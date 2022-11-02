module V1
  class SessionsController < ApplicationController
    def create
      user = User.find_by(email: params[:email])

      if user&.valid_password?(params[:password])
        render json: user.to_json(only: %i[id authentication_token]), status: :created
      else
        render status: :unauthorized
      end
    end

    def destroy
      current_user = User.where(id: params[:id], authentication_token: params[:authentication_token])

      if current_user&.update(authentication_token: nil)
        render status: :ok
      else
        render status: :not_found
      end
    end
  end
end
