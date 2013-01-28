FactoryGirl.define do
  factory :user do
    name "Some User"
    email "some.user@somedomain.xxx"
    password "password"
    password_confirmation "password"
  end
end