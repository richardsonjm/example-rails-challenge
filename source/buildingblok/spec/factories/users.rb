FactoryGirl.define do
  factory :user do
    sequence(:first_name) {|n| "Firstname#{n}"}
    sequence(:last_name) {|n| "Lastname#{n}"}
  end
end
