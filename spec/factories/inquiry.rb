FactoryBot.define do
  factory :inquiry, class: Inquiry do
    name { Faker::Name.name }
    message { 'aaaaaaaaaaaaaaaaaaaaaaaa' }
    email { Faker::Internet.free_email }
  end
end
