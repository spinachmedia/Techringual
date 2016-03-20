require 'test_helper'

class EnglishMstsControllerTest < ActionController::TestCase
  setup do
    @english_mst = english_msts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:english_msts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create english_mst" do
    assert_difference('EnglishMst.count') do
      post :create, english_mst: { mean: @english_mst.mean, valid: @english_mst.valid, word: @english_mst.word }
    end

    assert_redirected_to english_mst_path(assigns(:english_mst))
  end

  test "should show english_mst" do
    get :show, id: @english_mst
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @english_mst
    assert_response :success
  end

  test "should update english_mst" do
    patch :update, id: @english_mst, english_mst: { mean: @english_mst.mean, valid: @english_mst.valid, word: @english_mst.word }
    assert_redirected_to english_mst_path(assigns(:english_mst))
  end

  test "should destroy english_mst" do
    assert_difference('EnglishMst.count', -1) do
      delete :destroy, id: @english_mst
    end

    assert_redirected_to english_msts_path
  end
end
