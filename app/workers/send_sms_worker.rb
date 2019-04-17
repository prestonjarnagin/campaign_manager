class SendSmsWorker
  include Sidekiq::Worker

  def perform(contact_message_id)
    p "Enter SMS Worker"
    SMSService.send_single_message(contact_message_id)
  end
end
