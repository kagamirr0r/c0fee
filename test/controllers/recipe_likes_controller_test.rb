require 'test_helper'

class RecipeLikesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get recipe_likes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get recipe_likes_destroy_url
    assert_response :success
  end

end
