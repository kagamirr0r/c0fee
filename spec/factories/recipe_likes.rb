FactoryBot.define do
  factory :recipe_like do
    recipe_id { Faker::Number.unique.number(1) }
    user_id { Faker::Number.unique.number(1) }
  end
end
