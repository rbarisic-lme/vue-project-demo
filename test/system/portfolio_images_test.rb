require "application_system_test_case"

class PortfolioImagesTest < ApplicationSystemTestCase
  setup do
    @portfolio_image = portfolio_images(:one)
  end

  test "visiting the index" do
    visit portfolio_images_url
    assert_selector "h1", text: "Portfolio Images"
  end

  test "creating a Portfolio image" do
    visit portfolio_images_url
    click_on "New Portfolio Image"

    click_on "Create Portfolio image"

    assert_text "Portfolio image was successfully created"
    click_on "Back"
  end

  test "updating a Portfolio image" do
    visit portfolio_images_url
    click_on "Edit", match: :first

    click_on "Update Portfolio image"

    assert_text "Portfolio image was successfully updated"
    click_on "Back"
  end

  test "destroying a Portfolio image" do
    visit portfolio_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Portfolio image was successfully destroyed"
  end
end
