class MessagesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  #recurrence { hourly.minute_of_hour(0, 15, 30, 45) }
  #recurrence { minutely(1) }

  def perform()
    time_ini = Time.now
    # time_end = Time.now + (15*60)
    time_end = Time.now + (5*60)
    m = Message.where(delivery_date: time_ini..time_end)
    m.each do |msg|
      u = User.find_by_id(msg.user_id)
      MessageMailer.message_delivery(u,msg).deliver
    end
  end
end


