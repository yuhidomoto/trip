FactoryBot.define do
  factory :admin do
  	name { Faker::Lorem.characters(number:6) }
  	email { Faker::Internet.email }
  	password { 'admins' }
  	password_confirmation { 'admins' }
  end
end