require 'test_helper'

class CaloriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calory = calories(:one)
  end

  test "should get index" do
    get calories_url
    assert_response :success
  end

  test "should get new" do
    get new_calory_url
    assert_response :success
  end

  test "should create calory" do
    assert_difference('Calory.count') do
      post calories_url, params: { calory: { comment: @calory.comment, type_value: @calory.type_value, user_id: @calory.user_id, value: @calory.value } }
    end

    assert_redirected_to calory_url(Calory.last)
  end

  test "should show calory" do
    get calory_url(@calory)
    assert_response :success
  end

  test "should get edit" do
    get edit_calory_url(@calory)
    assert_response :success
  end

  test "should update calory" do
    patch calory_url(@calory), params: { calory: { comment: @calory.comment, type_value: @calory.type_value, user_id: @calory.user_id, value: @calory.value } }
    assert_redirected_to calory_url(@calory)
  end

  test "should destroy calory" do
    assert_difference('Calory.count', -1) do
      delete calory_url(@calory)
    end

    assert_redirected_to calories_url
  end
end
