class SMSService

  def initialize(messages)
    @messages = messages
  end

  def send
    
  end

  def send
    messages.each do |contact_message|
      SendSmsWorker.perform_async(contact_message)
    end
  end
end
