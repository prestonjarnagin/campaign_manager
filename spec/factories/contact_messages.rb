FactoryBot.define do
  factory :contact_message do
    message
    contact
    send_time { rand(5.days.ago..(Time.now + 5.days)) }
    sent { [true, false].sample }

  end
end
