class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.initial_registration.subject
  #
  def initial_registration(user)
    @greeting = "Hi"
    mail to: user.email
  end
end
