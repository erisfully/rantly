class UserMailer < ActionMailer::Base
  default :from => 'admin@rantlyapp.com'
  default host: Rails.root

  def registration_email(user)
    @confirmation_token = user.confirmation_token
    @url = Rails.env.production? ? 'http://rantlyapp.herokuapp.com/' : 'http://localhost:3000'
    mail(:to => user.email, :subject => "Thanks for registering!")
  end

  def confirmation_email(user)
    @user = user
    @url = Rails.env.production? ? 'http://rantlyapp.herokuapp.com/' : 'http://localhost:3000'
    mail(:to => user.email, :subject => "Please confirm your email")
  end

  def follower_email(user, rant)
    @rant = rant
    user.follows.each do |followee|
    @user = followee.user
    @url = Rails.env.production? ? 'http://rantlyapp.herokuapp.com/' : 'http://localhost:3000'
    mail(:to => followee.user.email, :subject => "#{followee.user.first_name} Ranted")
    end
  end

end