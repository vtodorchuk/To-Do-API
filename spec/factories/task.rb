FactoryBot.define do
  factory :task do
    project
    title { FFaker::Lorem.word }
    deadline { DateTime.now + rand(0..30).days }
    position { 0 }
    completed { false }
  end
end
