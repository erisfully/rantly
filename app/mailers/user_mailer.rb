class UserMailer < ActionMailer::Base
  default :from => ' ihaterantly@gmail.com'

  def registration_email(user)
    mail(:to => user.email, :subject => "Registered!", :subject => "Thanks for registering!")
  end
end