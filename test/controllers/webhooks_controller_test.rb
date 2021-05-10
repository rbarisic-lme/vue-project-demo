require "test_helper"

class WebhooksControllerTest < ActionDispatch::IntegrationTest
  test "should get getid_complete" do
    get webhooks_getid_complete_url
    assert_response :success
  end
end
