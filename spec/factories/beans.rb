FactoryBot.define do
  factory :bean, class: Bean do
    user_id { 1 }
    shop_id { 1 }
    country { Faker::Nation.nationality }
    area { Faker::Nation.capital_city }
    variety { Faker::Coffee.variety }
    farm { Faker::Name.first_name }
    process { 'ナチュラル' }
    roast { 'フルシティ' }
    price { Faker::Number.unique.number(100..10_000) }
    bean_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/bean.png')) }
    bean_url { Faker::Internet.url }
    association :user
    association :shop
	end

	factory :anoter_bean, class: Bean do
    user_id { 1 }
    shop_id { 1 }
    country { Faker::Nation.nationality }
    area { Faker::Nation.capital_city }
    variety { Faker::Coffee.variety }
    farm { Faker::Name.first_name }
    process { 'ウォッシュド' }
    roast { 'シティ' }
    price { Faker::Number.unique.number(100..10_000) }
    bean_image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/bean.png')) }
    bean_url { Faker::Internet.url }
    association :user
    association :shop
	end
end
