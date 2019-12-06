FactoryBot.define do
	factory :shop_like do
		association :user
		association :shop
  end
end
