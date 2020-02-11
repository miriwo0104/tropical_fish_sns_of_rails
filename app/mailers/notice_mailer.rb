class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.initial_registration.subject
  #
  def initial_registration(user)
    @greeting = "Hi"
    @link = "http://localhost:3000/users/input_id"
    @random_id = user.random_id
    mail to: user.address
  end
  
  def password_reset(user)
    @random_id = user.random_id
    @link = "http://localhost:3000/users/password_reset_main"
    mail to: user.address
  end
end
