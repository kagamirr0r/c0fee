FactoryBot.define do
  factory :bean_like do
    bean_id { Faker::Number.number(digits: 1) }
    user_id { Faker::Number.number(digits: 1) }
    association :bean
    association :user
  end
end
