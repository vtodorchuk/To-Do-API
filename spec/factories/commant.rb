FactoryBot.define do
  factory :comment do
    project
    user
    body { FFaker::Lorem.sentence(5) }
  end
end


