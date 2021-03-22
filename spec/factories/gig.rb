FactoryBot.define do
  factory :gig do
    creator
    brand_name { Faker::Company.name.to_s }
  end
end
