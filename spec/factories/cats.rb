# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cat do
    association :user
    name "Aiko"
    age 1
  end
end
