class QanoteMailer < ActionMailer::Base
  
  default :from => "admin@kreatio.com"
  def newtag(user)
    @recipient = "#{user.email}"
    mail(:to => "rituraj@kreatio.com", :subject => "New tag created")
  end
end
