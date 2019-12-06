FactoryBot.define do
  factory :shop do
		name {Faker::Restaurant.name}
		address {Faker::Address.street_address}
		url{Faker::Internet.url}
  end
end
