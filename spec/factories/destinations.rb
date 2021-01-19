FactoryBot.define do
  factory :destination do
    place { Faker::Address.city }
    image { Rack::Test::UploadedFile.new(Rails.root.join("spec/support/images/rio.jpg")) }
  end
end
