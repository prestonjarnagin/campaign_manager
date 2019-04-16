desc "Send text messages from the ContactMessages table"
task :send_messages => :environment do
  p "BEGIN RAKE:SEND_MESSAGES"
  messages = ContactMessage.message_queue
  SMSService.new(messages).send
end
