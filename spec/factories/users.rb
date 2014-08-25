FactoryGirl.define do
  factory :user do
    name "user"
  	email "user@factorygirl.com"
  	is_admin false
  	is_blocked false
  end
  factory :admin, class: User do
    name "admin"
  	email "admin@factorygirl.com"
  	is_admin true
  	is_blocked false
  end
end