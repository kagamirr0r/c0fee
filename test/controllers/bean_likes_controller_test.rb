require 'test_helper'

class BeanLikesControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get bean_likes_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get bean_likes_destroy_url
    assert_response :success
  end
end
