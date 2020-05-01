FactoryBot.define do
  factory :recipe, class: Recipe do
    user_id { Faker::Number.number(digits: 1) }
    bean_id { Faker::Number.number(digits: 1) }
    hot_ice { 'ホット' }
    grind { '中挽き' }
    temperature { Faker::Number.within(range: 60..100) }
    amount { Faker::Number.within(range: 1..1000) }
    extraction { 'フレンチプレス' }
    association :bean
    association :user
  end

  factory :another_recipe, class: Recipe do
    user_id { Faker::Number.number(digits: 1) }
    bean_id { Faker::Number.number(digits: 1) }
    hot_ice { 'アイス' }
    grind { '細挽き' }
    temperature { Faker::Number.within(range: 60..100) }
    amount { Faker::Number.within(range: 1..1000) }
    extraction { 'ペーパーフィルター' }
    association :bean
    association :user
  end
end
