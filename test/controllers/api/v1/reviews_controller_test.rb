require "test_helper"

class Api::V1::ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:one)
  end

  test "should get index" do
    get api_v1_reviews_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_review_url
    assert_response :success
  end

  test "should create review" do
    assert_difference('Review.count') do
      post api_v1_reviews_url, params: { review: {  } }
    end

    assert_redirected_to review_url(Review.last)
  end

  test "should show review" do
    get api_v1_review_url(@review)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_review_url(@review)
    assert_response :success
  end

  test "should update review" do
    patch api_v1_review_url(@review), params: { review: {  } }
    assert_redirected_to review_url(@review)
  end

  test "should destroy review" do
    assert_difference('Review.count', -1) do
      delete api_v1_review_url(@review)
    end

    assert_redirected_to api_v1_reviews_url
  end
end
