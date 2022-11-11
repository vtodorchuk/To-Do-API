FactoryBot.define do
  factory :comment do
    task
    body { FFaker::Lorem.word }
  end
end
