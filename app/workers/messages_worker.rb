class MessagesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # The app will check every 15 minutes for messages to be sent.
  #recurrence { hourly.minute_of_hour(0, 15, 30, 45) }
  recurrence { minutely(2) }

  def perform()
    time_ini = Time.now
    #time_end = Time.now + (15*60)
    time_end = Time.now + (5*60)
    m = Message.where(delivery_date: time_ini..time_end)
    m.each do |msg|
      u = User.find_by_id(msg.user_id)
      MessageMailer.message_delivery(u,msg).deliver
      msg.last_sent = msg.delivery_date
      msg.delivery_date = Message.getRandomDate()
      msg.times_sent == nil ? msg.times_sent = 1 : msg.times_sent += 1
      msg.save!
    end
  end
end


