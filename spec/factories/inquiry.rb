FactoryBot.define do
  factory :inquiry, class: Inquiry do
    name { Faker::Name.name }
		message { Faker::String.random(length: 10..300) }
		email {'a' * 10}
  end
end
