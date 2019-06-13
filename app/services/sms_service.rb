class SMSService

  def initialize(messages)
    @_messages = messages
  end

  def self.send_single_message(contact_message_id)
    # Assuming all contacts are U.S. phone numbers

    contact_message = ContactMessage.find(contact_message_id)
    original = contact_message.contact.phone_number
    country_code = '+1'
    formatted_number = country_code + original.gsub(/^1\-|^\+1|(x.*)|(\D)/, '')
    body = parse_message(contact_message_id)
    from = ENV['TWILIO_FROM_NUMBER']

    if Rails.env == 'test'
      to = '+15005550006'
    else
      to = formatted_number
    end
    response = client.api.account.messages.create(
      from: from,
      to: to,
      body: body
    )

    if response.error_code == 0
      contact_message.update!(sent: true)
    end
    return response

  end

  def self.parse_message(contact_message_id)
    contact_message = ContactMessage.find(contact_message_id)
    name = contact_message.contact.name
    contact_message.message.text.gsub("<name>", name)
  end

  def send
    messages.each do |contact_message|
      SendSmsWorker.perform_async(contact_message.id)
      p "Message Enqueued"
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
