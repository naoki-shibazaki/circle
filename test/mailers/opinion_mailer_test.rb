require 'test_helper'

class OpinionMailerTest < ActionMailer::TestCase
  test "send_opinion" do
    mail = OpinionMailer.send_opinion
    assert_equal "Send opinion", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
