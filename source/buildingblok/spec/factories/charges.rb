FactoryGirl.define do
  factory :charge do
    amount { rand(0.0..1000).round(2) }

    trait :successful do
      paid true
      refunded false
    end

    trait :disputed do
      paid true
      refunded true
    end

    trait :failed do
      paid false
      refunded false
    end

    factory :user_charge do
      association :chargeable, :factory => :user
      chargeable_type 'User'
    end

    factory :company_charge do
      association :chargeable, :factory => :company
      chargeable_type 'Company'
    end
  end
end
