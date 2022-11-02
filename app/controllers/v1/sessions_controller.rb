class V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user&.valid_password?(params[:password])
      render json: user.to_json(only: [:id, :authentication_token]), status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy
    current_user = User.find(params[:id])

    if current_user&.update(authentication_token: '')
      render status: :ok
    else
      head(:unauthorized)
    end
  end
end
