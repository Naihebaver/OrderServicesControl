require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pages_index_url
    assert_response :success
  end

  test "should get search_order" do
    get pages_search_order_url
    assert_response :success
  end

  test "should get order_status" do
    get pages_order_status_url
    assert_response :success
  end

end
