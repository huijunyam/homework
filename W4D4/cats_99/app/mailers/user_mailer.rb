class UserMailer < ActionMailer::Base
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.username, subject: 'Welcome to 99 cats!')
  end
end
