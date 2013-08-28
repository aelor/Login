class UserMailer < ActionMailer::Base
  default from: "admin@qanote.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "<#{user.email}>", :subject => "Registered for Quality assurance management system.")
  end
  
  def password_reset(user)
    @user = user
    mail(:to => "<#{user.email}>", :subject => "Reset QAMS password")
  end
end
