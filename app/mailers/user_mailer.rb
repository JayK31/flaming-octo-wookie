class UserMailer < ActionMailer::Base
  default from: "jay.kaye31@gmail.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://tripcollaborator.heroku.com'
  	mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
