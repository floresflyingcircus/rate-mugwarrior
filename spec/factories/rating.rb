# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :rating do
    association :user
    association :beer
    rank 5
  end
end
