FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    passowed { rand(0..9) * 6 }
  end
end

