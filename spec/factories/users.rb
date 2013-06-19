# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}example@example.com" }
    factory :invalid_user do
      email nil
    end
  end
end
