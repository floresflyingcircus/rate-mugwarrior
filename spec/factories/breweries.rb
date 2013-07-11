# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :brewery do
    sequence(:name) { |n| "brewery name#{n}" }
    factory :invalid_brewer do
      name nil
    end
  end
end
