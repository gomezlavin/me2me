class MessagesWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # recurrence { hourly.minute_of_hour(0, 15, 30, 45) }
  #recurrence { minutely(1) }

  def perform()
    user = User.last
    UserMailer.registration_confirmation(user).deliver
  end
end
