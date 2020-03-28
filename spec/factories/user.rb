FactoryBot.define do
  factory :user do
  	name { Faker::Lorem.characters(number:6) }
  	email { Faker::Internet.email }
  	password { 'yuhi44' }
  	password_confirmation { 'yuhi44' }
  end
end