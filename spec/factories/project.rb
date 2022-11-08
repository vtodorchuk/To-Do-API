FactoryBot.define do
  factory :project do
    user
    name { FFactory::Lorem.word }
  end
end
