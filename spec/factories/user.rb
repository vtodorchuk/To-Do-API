FactoryBot.define do
  factory :user do
    username { FFaker::Lorem.characters(User::MIN_USERNAME_LENGTH.next) }
    password { 'password' }
  end
end
