require 'test_helper'

class Users::InquiriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_inquiries_index_url
    assert_response :success
  end

  test "should get new" do
    get users_inquiries_new_url
    assert_response :success
  end

  test "should get show" do
    get users_inquiries_show_url
    assert_response :success
  end

end
