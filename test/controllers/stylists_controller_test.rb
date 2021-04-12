require "test_helper"

class StylistsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stylists_index_url
    assert_response :success
  end
end
