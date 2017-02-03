FactoryGirl.define do
  factory :search do
    title { Faker::Pokemon.name }
  end
end
