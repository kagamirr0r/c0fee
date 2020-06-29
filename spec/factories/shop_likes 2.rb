FactoryBot.define do
  factory :shop_like do
    association :shop
    association :user
  end
end
