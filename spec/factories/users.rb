FactoryGirl.define do
  factory :user do
  	email "factorygirl@rspec.com"
  end
  factory :admin, class: User do
  end
end