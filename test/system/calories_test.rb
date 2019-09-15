require "application_system_test_case"

class CaloriesTest < ApplicationSystemTestCase
  setup do
    @calory = calories(:one)
  end

  test "visiting the index" do
    visit calories_url
    assert_selector "h1", text: "Calories"
  end

  test "creating a Calorie" do
    visit calories_url
    click_on "New Calorie"

    fill_in "Comment", with: @calory.comment
    fill_in "Type value", with: @calory.type_value
    fill_in "User", with: @calory.user_id
    fill_in "Value", with: @calory.value
    click_on "Create Calorie"

    assert_text "Calorie was successfully created"
    click_on "Back"
  end

  test "updating a Calorie" do
    visit calories_url
    click_on "Edit", match: :first

    fill_in "Comment", with: @calory.comment
    fill_in "Type value", with: @calory.type_value
    fill_in "User", with: @calory.user_id
    fill_in "Value", with: @calory.value
    click_on "Update Calorie"

    assert_text "Calorie was successfully updated"
    click_on "Back"
  end

  test "destroying a Calorie" do
    visit calories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Calorie was successfully destroyed"
  end
end
