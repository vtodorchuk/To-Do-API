FactoryBot.define do
  factory :comment do
    task
    body { FFaker::Lorem.sentence(4) }
  end
end
