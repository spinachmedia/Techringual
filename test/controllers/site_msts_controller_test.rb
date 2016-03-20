require 'test_helper'

class SiteMstsControllerTest < ActionController::TestCase
  setup do
    @site_mst = site_msts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_msts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_mst" do
    assert_difference('SiteMst.count') do
      post :create, site_mst: { base_url: @site_mst.base_url, contents_name: @site_mst.contents_name, home_url: @site_mst.home_url }
    end

    assert_redirected_to site_mst_path(assigns(:site_mst))
  end

  test "should show site_mst" do
    get :show, id: @site_mst
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_mst
    assert_response :success
  end

  test "should update site_mst" do
    patch :update, id: @site_mst, site_mst: { base_url: @site_mst.base_url, contents_name: @site_mst.contents_name, home_url: @site_mst.home_url }
    assert_redirected_to site_mst_path(assigns(:site_mst))
  end

  test "should destroy site_mst" do
    assert_difference('SiteMst.count', -1) do
      delete :destroy, id: @site_mst
    end

    assert_redirected_to site_msts_path
  end
end
