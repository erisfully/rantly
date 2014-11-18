class UserMailer < ActionMailer::Base
  default :from => 'admin@rantlyapp.com'
  default host: Rails.root

  def registration_email(user)
    @url = Rails.env.production? ? 'http://rantlyapp.herokuapp.com/' : 'http://localhost:3000'
    mail(:to => user.email, :subject => "Thanks for registering!")
  end

  def confirmation_email(user)
    @url = Rails.env.production? ? 'http://rantlyapp.herokuapp.com/' : 'http://localhost:3000'
    mail(:to => user.email, :subject => "Please confirm your email")
  end

end