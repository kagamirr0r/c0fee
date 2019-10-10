require 'test_helper'

class TastesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get tastes_index_url
    assert_response :success
  end

  test 'should get show' do
    get tastes_show_url
    assert_response :success
  end

  test 'should get new' do
    get tastes_new_url
    assert_response :success
  end

  test 'should get edit' do
    get tastes_edit_url
    assert_response :success
  end

  test 'should get create' do
    get tastes_create_url
    assert_response :success
  end

  test 'should get update' do
    get tastes_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get tastes_destroy_url
    assert_response :success
  end
end
