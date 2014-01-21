class LettersWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  # The app will check every hor for letters to be sent.
  recurrence { hourly(1) }

  def perform()
    time_ini = Time.now
    time_end = Time.now + (60*60)
    l = Letter.where(delivery_date: time_ini..time_end)
    l.each do |ltr|
      u = User.find_by_id(ltr.user_id)
      MessageMailer.letter_delivery(u,ltr).deliver
    end
  end
end


