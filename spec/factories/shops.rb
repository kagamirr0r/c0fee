FactoryBot.define do
  factory :shop, class: Shop do
    name { Faker::Restaurant.name }
    address { Faker::Address.street_address }
    url { Faker::Internet.url }
	end

	factory :another_shop, class: Shop do
    name { Faker::Restaurant.name }
    address { Faker::Address.street_address }
    url { Faker::Internet.url }
  end
end
