require 'test_helper'

class ControlsControllerTest < ActionController::TestCase
  setup do
    @control = controls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control" do
    assert_difference('Control.count') do
      post :create, control: { area_id: @control.area_id, isOver: @control.isOver, team_id: @control.team_id }
    end

    assert_redirected_to control_path(assigns(:control))
  end

  test "should show control" do
    get :show, id: @control
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @control
    assert_response :success
  end

  test "should update control" do
    patch :update, id: @control, control: { area_id: @control.area_id, isOver: @control.isOver, team_id: @control.team_id }
    assert_redirected_to control_path(assigns(:control))
  end

  test "should destroy control" do
    assert_difference('Control.count', -1) do
      delete :destroy, id: @control
    end

    assert_redirected_to controls_path
  end
end
