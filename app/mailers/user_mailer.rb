class UserMailer < ActionMailer::Base
  default from: "Me-2-Me <info@me-2-me.com>"

  def registration_confirmation(user)
    @user = user
    @url  = 'http://me2me.herokuapp.com/sessions/new'
    attachments["test.jpg"] = File.read("#{Rails.root}/app/assets/images/test.jpg")
    #attachments.inline["test.jpg"] = File.read("#{Rails.root}/app/assets/images/test.jpg")
    mail(to: user.email, subject: "Registered")
  end
end
