FactoryBot.define do
  factory :inquiry, class: Inquiry do
    name { Faker::Name.name }
		message { Faker::Restaurant.review }
		email { Faker::Internet.email }
  end
end
