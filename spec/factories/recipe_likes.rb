FactoryBot.define do
  factory :recipe_like do
    recipe_id { Faker::Number.number(digits: 1) }
		user_id { Faker::Number.number(digits: 1) }
		association :recipe
		association :user
  end
end
