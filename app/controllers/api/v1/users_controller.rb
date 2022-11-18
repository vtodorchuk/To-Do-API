class Api::V1::UsersController < ApplicationController
  def create
    result = V1::User::Operation::Create.call(params: params)

    if result.success?
      render json: result[:data], status: :created
    else
      render json: I18n.t("session.sing_up.message.errors.#{result[:param]}"), status: :unprocessable_entity
    end
  end
end
