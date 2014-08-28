# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
  	name Faker::Lorem.word
  	description Faker::Lorem.sentence(5)
  end
end
