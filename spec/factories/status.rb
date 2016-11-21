FactoryGirl.define do
  factory :status do
    sequence(:title){|n| "Not Started#{n}" }

    transient do
      receipts_count 3
    end

    after(:create) do |status, evaluator|
      create_list(:receipt, evaluator.receipts_count, status: status)
    end
  end
end
