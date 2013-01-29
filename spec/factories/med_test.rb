FactoryGirl.define do
  factory :med_test do
    test_date Date.today.to_s
    sequence(:tracking_number) { |n| "123456-#{n}/12"}
  end
end