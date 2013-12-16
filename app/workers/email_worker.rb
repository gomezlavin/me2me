class EmailWorker
  include Sidekiq::Worker
  # Avoid retrying to run process when it fails
  # sidekiq_options retry: false

  def perform(user_id)
    user = User.find_by_id(user_id)
    UserMailer.registration_confirmation(user).deliver
  end
end
