require "test_helper"

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get api_v1_users_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_user_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post api_v1_users_url, params: { user: {  } }
    end

    assert_redirected_to user_url(User.last)
  end

  test "should show user" do
    get api_v1_user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch api_v1_user_url(@user), params: { user: {  } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete api_v1_user_url(@user)
    end

    assert_redirected_to api_v1_users_url
  end
end
