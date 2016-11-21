FactoryGirl.define do
  factory :receipt do
    sequence(:etsy_id)
    active  true
    user
    status
  end
end
