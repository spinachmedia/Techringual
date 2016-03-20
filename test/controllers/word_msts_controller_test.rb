require 'test_helper'

class WordMstsControllerTest < ActionController::TestCase
  setup do
    @word_mst = word_msts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:word_msts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create word_mst" do
    assert_difference('WordMst.count') do
      post :create, word_mst: { count: @word_mst.count, site_id: @word_mst.site_id, url: @word_mst.url, word: @word_mst.word }
    end

    assert_redirected_to word_mst_path(assigns(:word_mst))
  end

  test "should show word_mst" do
    get :show, id: @word_mst
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @word_mst
    assert_response :success
  end

  test "should update word_mst" do
    patch :update, id: @word_mst, word_mst: { count: @word_mst.count, site_id: @word_mst.site_id, url: @word_mst.url, word: @word_mst.word }
    assert_redirected_to word_mst_path(assigns(:word_mst))
  end

  test "should destroy word_mst" do
    assert_difference('WordMst.count', -1) do
      delete :destroy, id: @word_mst
    end

    assert_redirected_to word_msts_path
  end
end
