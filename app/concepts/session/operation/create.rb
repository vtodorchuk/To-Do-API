class Session::Operation::Create < Trailblazer::Operation
  step :find_user
  step :validates_password
  step :generate_tokens

  def find_user(ctx, params:, **)
    ctx[:user] = User.find_by(username: params[:username])
  end

  def validates_password(_ctx, params:, user:, **)
    user&.valid_password?(params[:password])
  end

  def generate_tokens(ctx, user:, **)
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
    ctx[:data] = session.login
  end
end
