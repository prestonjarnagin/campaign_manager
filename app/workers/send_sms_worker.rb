class SendSmsWorker
  include Sidekiq::Worker

  def perform(contact_message_id)
    SMSService.send_single_message(contact_message_id)
    p "Message Sent"
  end
end
