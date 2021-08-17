FactoryBot.define do
  factory :creator do
    first_name { Faker::Name.first_name.to_s }
    last_name { Faker::Name.last_name.to_s }
  end
end
