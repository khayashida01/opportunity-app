require 'test_helper'

class GeousersControllerTest < ActionController::TestCase
  setup do
    @geouser = geousers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:geousers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create geouser" do
    assert_difference('Geouser.count') do
      post :create, geouser: { address: @geouser.address, description: @geouser.description, latitude: @geouser.latitude, longitude: @geouser.longitude, title: @geouser.title }
    end

    assert_redirected_to geouser_path(assigns(:geouser))
  end

  test "should show geouser" do
    get :show, id: @geouser
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @geouser
    assert_response :success
  end

  test "should update geouser" do
    patch :update, id: @geouser, geouser: { address: @geouser.address, description: @geouser.description, latitude: @geouser.latitude, longitude: @geouser.longitude, title: @geouser.title }
    assert_redirected_to geouser_path(assigns(:geouser))
  end

  test "should destroy geouser" do
    assert_difference('Geouser.count', -1) do
      delete :destroy, id: @geouser
    end

    assert_redirected_to geousers_path
  end
end
