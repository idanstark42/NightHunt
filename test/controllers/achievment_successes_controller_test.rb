require 'test_helper'

class achievementSuccessesControllerTest < ActionController::TestCase
  setup do
    @achievement_success = achievement_successes(:one)
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

  test "should create achievement_success" do
    assert_difference('AchievementSuccess.count') do
      post :create, achievement_success: { achievement_id: @achievement_success.achievement_id, team_id: @achievement_success.team_id }
    end

    assert_redirected_to achievement_success_path(assigns(:achievement_success))
  end

  test "should show achievement_success" do
    get :show, id: @achievement_success
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @achievement_success
    assert_response :success
  end

  test "should update achievement_success" do
    patch :update, id: @achievement_success, achievement_success: { achievement_id: @achievement_success.achievement_id, team_id: @achievement_success.team_id }
    assert_redirected_to achievement_success_path(assigns(:achievement_success))
  end

  test "should destroy achievement_success" do
    assert_difference('AchievementSuccess.count', -1) do
      delete :destroy, id: @achievement_success
    end

    assert_redirected_to achievement_successes_path
  end
end
