module V1
  class UserService
    def self.check_user_email(email)
      user = User.where(email: email).first
      return true if user.nil?

      false
    end

    def self.check_password(password, password_confirmation)
      return false if password && password_confirmation

      password.eql?(password_confirmation)
    end
  end
end
