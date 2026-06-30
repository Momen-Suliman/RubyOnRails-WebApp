require "test_helper"

class ApplicationMailerTest < ActiveSupport::TestCase
  test "application mailer uses the default sender and layout" do
    mailer = ApplicationMailer.new

    assert_equal "from@example.com", mailer.class.default_params[:from]
    assert_equal "mailer", mailer.class._layout
  end
end
