class User < ApplicationRecord
  def valid_password?(confirmation_password)
    password.match(confirmation_password)
  end
end
