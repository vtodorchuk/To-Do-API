class User < ApplicationRecord
  MAX_USERNAME_LENGTH = 50
  MIN_USERNAME_LENGTH = 3

  MIN_PASSWORD_LENGTH = 8
  PASSWORD_FORMAT = /[a-zA-Z]*/.freeze

  validates :username, allow_blank: false, length: { minimum: MIN_USERNAME_LENGTH, maximum: MAX_USERNAME_LENGTH }
  validates :password, allow_blank: false, length: { minimum: MIN_PASSWORD_LENGTH },
                       format: { with: PASSWORD_FORMAT,
                                 message: 'Password length should be 8 characters, alphanumeric.' }

  def valid_password?(param_password)
    password.match(param_password)
  end
end
