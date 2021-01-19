FactoryBot.define do
  factory :participant do
    email { Faker::Internet.email }
    name { Faker::Name.name }
  end
end
