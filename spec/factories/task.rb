FactoryBot.define do
  factory :task do
    project
    title { FFaker::Lorem.word }
    deadline { DateTime.now + 3.days }
    completed { false }
  end
end
