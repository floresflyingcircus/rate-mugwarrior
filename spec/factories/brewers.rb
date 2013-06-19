# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :brewer do
    name { Faker::Company.name }
    factory :invalid_brewer do
      name nil
    end
  end
end
