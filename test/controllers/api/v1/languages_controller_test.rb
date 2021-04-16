require "test_helper"

class Api::V1::LanguagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @language = languages(:one)
  end

  test "should get index" do
    get api_v1_languages_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_language_url
    assert_response :success
  end

  test "should create language" do
    assert_difference('Language.count') do
      post api_v1_languages_url, params: { language: {  } }
    end

    assert_redirected_to language_url(Language.last)
  end

  test "should show language" do
    get api_v1_language_url(@language)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_language_url(@language)
    assert_response :success
  end

  test "should update language" do
    patch api_v1_language_url(@language), params: { language: {  } }
    assert_redirected_to language_url(@language)
  end

  test "should destroy language" do
    assert_difference('Language.count', -1) do
      delete api_v1_language_url(@language)
    end

    assert_redirected_to api_v1_languages_url
  end
end
