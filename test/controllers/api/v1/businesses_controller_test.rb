require "test_helper"

class Api::V1::BusinessesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business = businesses(:one)
  end

  test "should get index" do
    get api_v1_businesses_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_business_url
    assert_response :success
  end

  test "should create business" do
    assert_difference('Business.count') do
      post api_v1_businesses_url, params: { business: {  } }
    end

    assert_redirected_to business_url(Business.last)
  end

  test "should show business" do
    get api_v1_business_url(@business)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_business_url(@business)
    assert_response :success
  end

  test "should update business" do
    patch api_v1_business_url(@business), params: { business: {  } }
    assert_redirected_to business_url(@business)
  end

  test "should destroy business" do
    assert_difference('Business.count', -1) do
      delete api_v1_business_url(@business)
    end

    assert_redirected_to api_v1_businesses_url
  end
end
