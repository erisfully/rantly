class UserMailer < ActionMailer::Base
  default :from => 'admin@rantlyapp.com'

  def registration_email(user)
    mail(:to => user.email, :subject => "Registered!", :subject => "Thanks for registering!")
  end
end