class V1::Session::Operation::Destroy < Trailblazer::Operation
  step :find_session

  def find_session(_ctx, payload:, **)
    session = JWTSessions::Session.new(refresh_by_access_allowed: true, payload: payload)
    session.flush_by_access_payload
  end
end
