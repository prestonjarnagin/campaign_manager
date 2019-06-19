FactoryBot.define do
  factory :message do
    text { Faker::Lorem.paragraph }
    # 10 Minutes to 90 Days
    elapse_minutes { rand(10..129600) }
    campaign
  end
end
