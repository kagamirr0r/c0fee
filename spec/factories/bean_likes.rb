FactoryBot.define do
  factory :bean_like do
    bean_id { Faker::Number.unique.number(1) }
    user_id { Faker::Number.unique.number(1) }
  end
end
