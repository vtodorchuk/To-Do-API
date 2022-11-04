JWTSessions.encryption_key = Constants::SECRET_KEY_BASE
JWTSessions.private_key = OpenSSL::PKey::RSA.generate(2048).to_pem
JWTSessions.token_store = :redis, { redis_url: 'redis://localhost:6379' }
