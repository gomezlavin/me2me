class MessagesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # The app will check every 15 minutes for messages to be sent.
  recurrence { hourly.minute_of_hour(0, 15, 30, 45) }

  def perform()
    time_ini = Time.now
    time_end = Time.now + (15*60)
    m = Message.where(delivery_date: time_ini..time_end)
    m.each do |msg|
      u = User.find_by_id(msg.user_id)
      MessageMailer.message_delivery(u,msg).deliver
    end
  end
end


