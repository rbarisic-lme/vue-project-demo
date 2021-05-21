require "test_helper"

class ReviewMailerTest < ActionMailer::TestCase
  test "verifiy_email" do
    mail = ReviewMailer.verifiy_email
    assert_equal "Verifiy email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
