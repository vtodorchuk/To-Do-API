JWTSessions.encryption_key = Constants::SECRET_KEY_BASE
JWTSessions.private_key = OpenSSL::PKey::RSA.generate(2048).to_pem
JWTSessions.token_store = :redis, { redis_url: 'redis://localhost:6379' }

JWTSessions.access_header  = "Authorization"
JWTSessions.access_cookie  = "jwt_access"
JWTSessions.refresh_header = "X-Refresh-Token"
JWTSessions.refresh_cookie = "jwt_refresh"
JWTSessions.csrf_header    = "X-CSRF-Token"
