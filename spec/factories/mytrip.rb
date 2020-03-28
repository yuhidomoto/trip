FactoryBot.define do
  factory :mytrip do
  	country {  Faker::Lorem.characters(number:5) }
  	area { Faker::Lorem.characters(number:5) }
    must { Faker::Lorem.characters(number:5) }
    important { Faker::Lorem.characters(number:5) }
  	user
  end
end