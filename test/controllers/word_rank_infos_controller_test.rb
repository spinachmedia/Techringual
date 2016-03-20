require 'test_helper'

class WordRankInfosControllerTest < ActionController::TestCase
  setup do
    @word_rank_info = word_rank_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:word_rank_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create word_rank_info" do
    assert_difference('WordRankInfo.count') do
      post :create, word_rank_info: { count: @word_rank_info.count, site_id: @word_rank_info.site_id, word: @word_rank_info.word }
    end

    assert_redirected_to word_rank_info_path(assigns(:word_rank_info))
  end

  test "should show word_rank_info" do
    get :show, id: @word_rank_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @word_rank_info
    assert_response :success
  end

  test "should update word_rank_info" do
    patch :update, id: @word_rank_info, word_rank_info: { count: @word_rank_info.count, site_id: @word_rank_info.site_id, word: @word_rank_info.word }
    assert_redirected_to word_rank_info_path(assigns(:word_rank_info))
  end

  test "should destroy word_rank_info" do
    assert_difference('WordRankInfo.count', -1) do
      delete :destroy, id: @word_rank_info
    end

    assert_redirected_to word_rank_infos_path
  end
end
