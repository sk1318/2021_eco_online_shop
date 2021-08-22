require 'test_helper'

class Public::CardControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_card_new_url
    assert_response :success
  end

  test "should get show" do
    get public_card_show_url
    assert_response :success
  end

end
