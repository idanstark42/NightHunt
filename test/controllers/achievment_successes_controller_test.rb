require 'test_helper'

class AchievmentSuccessesControllerTest < ActionController::TestCase
  setup do
    @achievment_success = achievment_successes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:achievement_successes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create achievment_success" do
    assert_difference('AchievementSuccess.count') do
      post :create, achievment_success: { achievment_id: @achievment_success.achievment_id, team_id: @achievment_success.team_id }
    end

    assert_redirected_to achievment_success_path(assigns(:achievment_success))
  end

  test "should show achievment_success" do
    get :show, id: @achievment_success
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @achievment_success
    assert_response :success
  end

  test "should update achievment_success" do
    patch :update, id: @achievment_success, achievment_success: { achievment_id: @achievment_success.achievment_id, team_id: @achievment_success.team_id }
    assert_redirected_to achievment_success_path(assigns(:achievment_success))
  end

  test "should destroy achievment_success" do
    assert_difference('AchievementSuccess.count', -1) do
      delete :destroy, id: @achievment_success
    end

    assert_redirected_to achievment_successes_path
  end
end
