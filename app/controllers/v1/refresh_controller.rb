module V1
  class RefreshController < ApplicationController
    before_action :authorizauthorize_refresh_request!

    def create
      session = JWTSession::Session.new(payload: payload, refresh_by_access_allowed: true)
      token = session.refresh_by_access_allowed do
        raise JWTSessions::Errors::Unauthorized, I18n.t('session.errors.something_not_right')
      end

      render json: { csrf: token[:csrf] }
    end
  end
end
