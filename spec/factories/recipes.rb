FactoryBot.define do
  factory :recipe do
    user_id { Faker::Number.unique.number(1) }
    bean_id { Faker::Number.unique.number(1) }
    hot_ice { 'hot' }
    grind { 'madiam' }
    temperature { Faker::Number.within(range: 60..100) }
    amount { Faker::Number.within(range: 1..1000) }
    extraction { 'paper' }

    association :bean
    association :user
  end
end
