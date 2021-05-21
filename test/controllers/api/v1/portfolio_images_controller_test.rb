require "test_helper"

class Api::V1::PortfolioImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @portfolio_image = portfolio_images(:one)
  end

  test "should get index" do
    get api_v1_portfolio_images_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_portfolio_image_url
    assert_response :success
  end

  test "should create portfolio_image" do
    assert_difference('PortfolioImage.count') do
      post api_v1_portfolio_images_url, params: { portfolio_image: {  } }
    end

    assert_redirected_to portfolio_image_url(PortfolioImage.last)
  end

  test "should show portfolio_image" do
    get api_v1_portfolio_image_url(@portfolio_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_portfolio_image_url(@portfolio_image)
    assert_response :success
  end

  test "should update portfolio_image" do
    patch api_v1_portfolio_image_url(@portfolio_image), params: { portfolio_image: {  } }
    assert_redirected_to portfolio_image_url(@portfolio_image)
  end

  test "should destroy portfolio_image" do
    assert_difference('PortfolioImage.count', -1) do
      delete api_v1_portfolio_image_url(@portfolio_image)
    end

    assert_redirected_to api_v1_portfolio_images_url
  end
end
