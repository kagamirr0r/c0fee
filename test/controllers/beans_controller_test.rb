require 'test_helper'

class BeansControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get beans_index_url
    assert_response :success
  end

  test 'should get show' do
    get beans_show_url
    assert_response :success
  end

  test 'should get new' do
    get beans_new_url
    assert_response :success
  end

  test 'should get edit' do
    get beans_edit_url
    assert_response :success
  end

  test 'should get create' do
    get beans_create_url
    assert_response :success
  end

  test 'should get update' do
    get beans_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get beans_destroy_url
    assert_response :success
  end
end
