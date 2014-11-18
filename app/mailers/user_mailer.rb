class UserMailer < ActionMailer::Base
  default :from => 'admin@rantly.com'

  def registration_email(user)
    mail(:to => user.email, :subject => "Registered!", :subject => "Thanks for registering!")
  end
end