require "test_helper"

class Api::V1::BankAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bank_account = bank_accounts(:one)
  end

  test "should get index" do
    get api_v1_bank_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_api_v1_bank_account_url
    assert_response :success
  end

  test "should create bank_account" do
    assert_difference('BankAccount.count') do
      post api_v1_bank_accounts_url, params: { bank_account: {  } }
    end

    assert_redirected_to bank_account_url(BankAccount.last)
  end

  test "should show bank_account" do
    get api_v1_bank_account_url(@bank_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_v1_bank_account_url(@bank_account)
    assert_response :success
  end

  test "should update bank_account" do
    patch api_v1_bank_account_url(@bank_account), params: { bank_account: {  } }
    assert_redirected_to bank_account_url(@bank_account)
  end

  test "should destroy bank_account" do
    assert_difference('BankAccount.count', -1) do
      delete api_v1_bank_account_url(@bank_account)
    end

    assert_redirected_to api_v1_bank_accounts_url
  end
end
