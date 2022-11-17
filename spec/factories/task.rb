FactoryBot.define do
  factory :task do
    project
    title { FFaker::Lorem.word }
    deadline { Time.zone.now.to_datetime + 3.days }
    completed { false }
  end
end
