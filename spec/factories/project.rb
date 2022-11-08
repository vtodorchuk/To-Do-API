FactoryBot.define do
  factory :project do
    user
    name { FFaker::Lorem.work }
  end
end
