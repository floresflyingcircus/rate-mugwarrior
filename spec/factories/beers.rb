# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :beer do
    sequence(:name) { |n| "beer name#{n}" }
    association :brewery
  end
end
