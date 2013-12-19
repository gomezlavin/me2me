class MessageMailer < ActionMailer::Base
  default from: "Me-2-Me <info@me-2-me.com>"

  # Sends future message to user
  def message_delivery(user,message)
    @user = user
    @message = message
    attachments["me2me.png"] = File.read("#{Rails.root}/app/assets/images/me2me.png")
    mail(to: user.email, subject: message.title)
  end
end