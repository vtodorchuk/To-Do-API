FactoryBot.define do
  factory :user do
    username { FFaker::Lorem.word }
    password { 'password' }
  end
end
