FactoryGirl.define do
  factory :user do
    sequence(:etsy_id)

    factory :user_with_receipts do
      transient do
        receipts_count 3
      end

      after(:create) do |user, evaluator|
        create_list(:receipt, evaluator.receipts_count, user: user)
      end
    end
  end
end
