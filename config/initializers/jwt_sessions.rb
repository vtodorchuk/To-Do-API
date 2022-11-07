JWTSessions.algorithm = 'HS256'
JWTSessions.encryption_key = Rails.application.credentials.secret_jwt_encryption_key
JWTSessions.private_key = OpenSSL::PKey::RSA.generate(2048).to_pem

JWTSessions.token_store = :redis, {
  redis_host: '127.0.0.1',
  redis_port: '6379',
  redis_db_name: '0',
  token_prefix: 'jwt_'
}

JWTSessions.access_header  = 'Authorization'
JWTSessions.access_cookie  = 'jwt_access'
JWTSessions.refresh_header = 'X-Refresh-Token'
JWTSessions.refresh_cookie = 'jwt_refresh'
JWTSessions.csrf_header    = 'X-CSRF-Token'
