class UserMailer < ActionMailer::Base
  default from: "admin@qanote.com"
  
  def registration_confirmation(user)
    @user = user
    mail(:to => "<#{user.email}>", :subject => "Registered for Quality assurance management system.")
  end
end
