FactoryBot.define do
factory :shop_like do
	shop_id { Faker::Number.number(digits: 1) }
	user_id { Faker::Number.number(digits: 1) }
	association :shop
	association :user
  end
end
