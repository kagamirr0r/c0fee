FactoryBot.define do
  factory :recipe_like do
    association :recipe
    association :user
  end
end
