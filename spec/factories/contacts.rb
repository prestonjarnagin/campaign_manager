FactoryBot.define do
  factory :contact do
    name { Faker::TvShows::RuPaul.queen }
    internal_name { Faker::TvShows::RuPaul.queen }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
