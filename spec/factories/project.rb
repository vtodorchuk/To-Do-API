FactoryBot.define do
  factory :project do
    user
    name { FFaker::Lorem.word }
  end
end



