class SendSmsWorker
  include Sidekiq::Worker

  def perform(contact_message)
    SMSService.send_single_message(contact_message)
  end
end
