FactoryBot.define do
  factory :shop, class: Shop do
    name { Faker::Restaurant.name }
    address { Faker::Address.full_address }
    url { Faker::Internet.url }
  end

  factory :another_shop, class: Shop do
    name { Faker::Restaurant.name }
    address { Faker::Address.full_address }
    url { Faker::Internet.url }
  end
end
