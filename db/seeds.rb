# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  first_name: 'Preston',
  last_name: 'Jarnagin',
  email: 'prstnjarnagin@gmail.com',
  password: 'password'
)

contact = Contact.create(
  name: 'Preston Jarnagin',
  internal_name: 'Preston Jarnagin',
  phone_number: '00000000000'
)

campaign = Campaign.create(
  name: "Winter is Coming"
)

message = Message.create(
  text: "Hello!",
  elapse_minutes: 1000,
  campaign: campaign
)

contact.campaigns << campaign
campaign.contacts << contact
campaign.messages << message

ContactMessage.create(
  message: message,
  contact: contact,
  send_time: Time.now - 5.minutes,
  sent: true
)

ContactMessage.create(
  message: message,
  contact: contact,
  send_time: Time.now - 5.minutes,
  sent: true
)

ContactMessage.create(
  message: message,
  contact: contact,
  send_time: Time.now + 10.minutes,
  sent: true
)
