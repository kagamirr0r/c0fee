FactoryBot.define do
	factory :bean do
		user_id {Faker::Number.unique.number(1)}
		shop_id {Faker::Number.unique.number(1)}
		country {Faker::Nation.nationality}
		area {Faker::Coffee.origin}
		variety{Faker::Coffee.variety}
		farm {Faker::Name.first_name}
		process "natural"
		roast "fullcity"
		price{Faker::Number.unique.number(100..10000)}
		bean_image{Rack::Test::UploadedFile.new(File.join(Rails.root,'app/assets/images/bean.png'))}
  end
end
