FactoryBot.define do
  factory :recipe, class: Recipe do
    user_id { Faker::Number.number(digits: 1) }
    bean_id { Faker::Number.number(digits: 1) }
    hot_ice { Faker::Number.within(range: 0..1) }
    grind { Faker::Number.within(range: 0..5) }
    temperature { Faker::Number.within(range: 60..100) }
    extracted_amount { Faker::Number.within(range: 1..999) }
    amount { Faker::Number.within(range: 1..1000) }
    extraction { Faker::Number.within(range: 0..10) }
    association :bean
    association :user
  end

  factory :another_recipe, class: Recipe do
    user_id { Faker::Number.number(digits: 1) }
    bean_id { Faker::Number.number(digits: 1) }
    hot_ice { Faker::Number.within(range: 0..1) }
    grind { Faker::Number.within(range: 0..5) }
    temperature { Faker::Number.within(range: 60..100) }
    extracted_amount { Faker::Number.within(range: 1..1000) }
    amount { Faker::Number.within(range: 1..1000) }
    extraction { Faker::Number.within(range: 0..10) }
    association :bean
    association :user
  end
end
