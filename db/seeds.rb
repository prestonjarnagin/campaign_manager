# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  first_name: "Preston",
  last_name: "Jarnagin",
  email: "prstnjarnagin@gmail.com",
  password: "password",
)

contact = Contact.create(
  name: "John",
  internal_name: "John Doe",
  phone_number: "00000000000",
)

campaign = Campaign.create(
  name: "Test Campaign",
)

message_1 = Message.create(
  text: "Sent Immediately",
  elapse_minutes: 0,
  campaign: campaign,
)

message_2 = Message.create(
  text: "Sent After 10 Minutes",
  elapse_minutes: 10,
  campaign: campaign,
)

message_3 = Message.create(
  text: "Sent After 20 Minutes",
  elapse_minutes: 20,
  campaign: campaign,
)

contact.campaigns << campaign
campaign.contacts << contact
campaign.messages << message_1
campaign.messages << message_2
campaign.messages << message_3
