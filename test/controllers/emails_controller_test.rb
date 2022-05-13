require "test_helper"

class EmailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get emails_new_url
    assert_response :success
  end

  test "should get send" do
    get emails_send_url
    assert_response :success
  end

  test "should get view" do
    get emails_view_url
    assert_response :success
  end
end
