require 'test_helper'

class ImpressionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get impressions_index_url
    assert_response :success
  end

  test 'should get show' do
    get impressions_show_url
    assert_response :success
  end

  test 'should get new' do
    get impressions_new_url
    assert_response :success
  end

  test 'should get edit' do
    get impressions_edit_url
    assert_response :success
  end

  test 'should get create' do
    get impressions_create_url
    assert_response :success
  end

  test 'should get update' do
    get impressions_update_url
    assert_response :success
  end

  test 'should get destroy' do
    get impressions_destroy_url
    assert_response :success
  end
end
