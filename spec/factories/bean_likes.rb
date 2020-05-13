FactoryBot.define do
  factory :bean_like do
    association :bean
    association :user
  end
end
