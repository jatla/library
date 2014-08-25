
FactoryGirl.define do
  factory :user do
    name Faker::Name.name
  	sequence(:email) {|n| "user#{n}@example.com" }
  	is_admin false
  	is_blocked false
  end
  factory :admin, class: User do
    name "admin"
  	sequence(:email) {|n| "admin#{n}@example.com" }
  	is_admin true
  	is_blocked false
  end
end