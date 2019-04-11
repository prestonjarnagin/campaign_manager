class SMSService

  def initialize(messages)
    @_messages = messages
  end

  def self.send_single_message(contact_message)
    # Assuming all contacts are U.S. phone numbers
    original = contact_message.contact.phone_number
    country_code = '+1'
    formatted_number = country_code + original.gsub(/^1\-|^\+1|(x.*)|(\D)/, '')
    body = contact_message.message.text
    
    if Rails.env == 'test'
      from = ENV['TWILIO_FROM_NUMBER']
      to = '+15005550006'
    else
      ENV['TWILIO_FROM_NUMBER']
      to = formatted_number
    end
    res = client.api.account.messages.create(
      from: from,
      to: to,
      body: body
    )
  end

  def send
    messages.each do |contact_message|
      SendSmsWorker.perform_async(contact_message)
    end
  end

  private

  def messages
    @_messages
  end

  def self.client
    Twilio::REST::Client.new ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

end
