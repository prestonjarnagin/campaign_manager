FactoryBot.define do
  factory :campaign do
    name { Faker::Superhero.name }

    factory :campaign_with_messages do
      transient do
        messages_count { 5 }
      end
      after(:create) do |campaign, evaluator|
        create_list(:message, evaluator.messages_count, campaign: campaign)
      end
    end
  end
end
