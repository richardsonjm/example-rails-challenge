FactoryGirl.define do
  factory :company do
    sequence(:name) {|n| "Name#{n}"}
    zip_code { rand.to_s[2..6] }
  end
end
