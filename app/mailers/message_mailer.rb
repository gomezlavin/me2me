class MessageMailer < ActionMailer::Base
  default from: "Me-2-Me <info@me-2-me.com>"

  # Sends future message to user
  def message_delivery(user,message)
    @user = user
    @message = message
    mail(to: user.email, subject: message.title)
  end
end