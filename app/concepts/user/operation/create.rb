class User::Operation::Create < Trailblazer::Operation
  step :validates_user?
  step :create_user
  step :validates_password?
  step :save_user
  step :generate_tokens

  def validates_user?(ctx, params:, **)
    ctx[:param] = :username
    User.find_by(username: params[:username]).nil?
  end

  def validates_password?(ctx, user:, params:, **)
    ctx[:param] = :password
    user.valid_password?(params[:password_confirmation])
  end

  def create_user(ctx, params:, **)
    ctx[:user] = User.new(username: params[:username], password: params[:password])
  end

  def save_user(_ctx, user:, **)
    user.save
  end

  def generate_tokens(ctx, user:, **)
    payload = { user_id: user.id }
    session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
    ctx[:data] = session.login
  end
end
