class MessageMailer < ActionMailer::Base
  default from: "Me-2-Me <info@me-2-me.com>"

  # Sends future message to user
  def message_delivery(user,message)
    @user = user
    @message = message
    @created_at = message.created_at.strftime("%b-%d-%Y")
    attachments["me2me.png"] = File.read("#{Rails.root}/app/assets/images/me2me.png")
    mail(to: user.email, subject: message.title)
  end

  # Sends letter to the user
  def letter_delivery(user,letter)
    @user = user
    @letter = letter
    @created_at = letter.created_at.strftime("%b-%d-%Y")
    attachments["me2me.png"] = File.read("#{Rails.root}/app/assets/images/me2me.png")
    mail(to: user.email, subject: letter.subject)
  end

end