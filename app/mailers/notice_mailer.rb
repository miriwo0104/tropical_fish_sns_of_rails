class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.initial_registration.subject
  #
  def initial_registration(user)
    @greeting = "Hi"
    @link = "http://localhost:3000/"
    #@secure_id = user.secure_id
    mail to: user.email
  end
end
