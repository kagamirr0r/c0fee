require 'test_helper'

class ShopLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shop_likes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get shop_likes_destroy_url
    assert_response :success
  end

end
