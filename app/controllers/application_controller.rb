# frozen_string_literal: true

class ApplicationController < ActionController::API
  private

  def authorized?
    # TODO: check before action work if user is authorized in application
    # If he is
    # Then allow him use action
    # If he isn't
    # send 401 status unauthorized
  end
end
