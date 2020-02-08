require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "initial_registration" do
    mail = NoticeMailer.initial_registration
    assert_equal "Initial registration", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
