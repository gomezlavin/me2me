class EmailWorker
  include Sidekiq::Worker

  # Worker which sends out registration confirmation emails
  def perform(user_id)
    user = User.find_by_id(user_id)
    UserMailer.registration_confirmation(user).deliver
  end
end
