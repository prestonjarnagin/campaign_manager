class DashboardFacade
  attr_reader :message_queue

  def initialize
    @message_queue = ContactMessage.message_queue
  end

  def message_queue_count
    @message_queue.count
  end
end
