require 'test_helper'

class AccomplishmentsControllerTest < ActionController::TestCase
  setup do
    @accomplishment = accomplishments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accomplishments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accomplishment" do
    assert_difference('Accomplishment.count') do
      post :create, :accomplishment => {  }
    end

    assert_redirected_to accomplishment_path(assigns(:accomplishment))
  end

  test "should show accomplishment" do
    get :show, :id => @accomplishment
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @accomplishment
    assert_response :success
  end

  test "should update accomplishment" do
    put :update, :id => @accomplishment, :accomplishment => {  }
    assert_redirected_to accomplishment_path(assigns(:accomplishment))
  end

  test "should destroy accomplishment" do
    assert_difference('Accomplishment.count', -1) do
      delete :destroy, :id => @accomplishment
    end

    assert_redirected_to accomplishments_path
  end
end
