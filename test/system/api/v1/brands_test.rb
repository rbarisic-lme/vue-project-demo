require "application_system_test_case"

class Api::V1::BrandsTest < ApplicationSystemTestCase
  setup do
    @api_v1_brand = api_v1_brands(:one)
  end

  test "visiting the index" do
    visit api_v1_brands_url
    assert_selector "h1", text: "Api/V1/Brands"
  end

  test "creating a Brand" do
    visit api_v1_brands_url
    click_on "New Api/V1/Brand"

    click_on "Create Brand"

    assert_text "Brand was successfully created"
    click_on "Back"
  end

  test "updating a Brand" do
    visit api_v1_brands_url
    click_on "Edit", match: :first

    click_on "Update Brand"

    assert_text "Brand was successfully updated"
    click_on "Back"
  end

  test "destroying a Brand" do
    visit api_v1_brands_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Brand was successfully destroyed"
  end
end
