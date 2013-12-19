class UserMailer < ActionMailer::Base
  default from: "Me-2-Me <info@me-2-me.com>"

  # Sends mail to user confirming successful registration to Me-2-Me
  def registration_confirmation(user)
    @user = user
    @url  = "http://www.me-2-me.com/sessions/new"
    attachments["me2me.png"] = File.read("#{Rails.root}/app/assets/images/me2me.png")
    mail(to: user.email, subject: "Welcome to me-2-me!")
  end
end
