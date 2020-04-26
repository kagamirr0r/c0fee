FactoryBot.define do
factory :shop_like do
	shop_id { Faker::Number.unique.number(1) }
	user_id { Faker::Number.unique.number(1) }
  end
end
