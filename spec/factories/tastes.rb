FactoryBot.define do
  factory :taste, class: Taste do
    recipe_id { Faker::Number.number(digits: 1) }
    t_sour { Faker::Number.within(range: 1..5) }
    t_sweet { Faker::Number.within(range: 1..5) }
    t_bitter { Faker::Number.within(range: 1..5) }
    t_aroma { Faker::Number.within(range: 1..5) }
    t_fullbody { Faker::Number.within(range: 1..5) }
    t_comment { Faker::Coffee.notes }
    association :recipe
  end

  factory :another_taste, class: Taste do
    # recipe_id { Faker::Number.number(digits: 1) }
    t_sour { Faker::Number.within(range: 1..5) }
    t_sweet { Faker::Number.within(range: 1..5) }
    t_bitter { Faker::Number.within(range: 1..5) }
    t_aroma { Faker::Number.within(range: 1..5) }
    t_fullbody { Faker::Number.within(range: 1..5) }
    t_comment { Faker::Coffee.notes }
    association :recipe
  end
end
