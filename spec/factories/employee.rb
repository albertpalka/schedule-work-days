FactoryBot.define do
  factory :employee do
    sequence(:full_name) { Faker::Name.name }
  end
end
