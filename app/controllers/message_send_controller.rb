class MessageSendController < ApplicationController
  def update
    SMSService.new(ContactMessage.message_queue).send
    redirect_to dashboard_path, notice: "Messages Sent"
  end
end
