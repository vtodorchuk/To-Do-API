FactoryBot.define do
  factory :user do
    email { FFactory::Internet.email }
    password { rand(0.9) * 6 }
  end
end
