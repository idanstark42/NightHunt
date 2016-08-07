require 'test_helper'

class PuzzlePieceRevealsControllerTest < ActionController::TestCase
  setup do
    @puzzle_piece_reveal = puzzle_piece_reveals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:puzzle_piece_reveals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create puzzle_piece_reveal" do
    assert_difference('PuzzlepieceReveal.count') do
      post :create, puzzle_piece_reveal: { puzzle_piece_id: @puzzle_piece_reveal.puzzle_piece_id, team_id: @puzzle_piece_reveal.team_id }
    end

    assert_redirected_to puzzle_piece_reveal_path(assigns(:puzzle_piece_reveal))
  end

  test "should show puzzle_piece_reveal" do
    get :show, id: @puzzle_piece_reveal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @puzzle_piece_reveal
    assert_response :success
  end

  test "should update puzzle_piece_reveal" do
    patch :update, id: @puzzle_piece_reveal, puzzle_piece_reveal: { puzzle_piece_id: @puzzle_piece_reveal.puzzle_piece_id, team_id: @puzzle_piece_reveal.team_id }
    assert_redirected_to puzzle_piece_reveal_path(assigns(:puzzle_piece_reveal))
  end

  test "should destroy puzzle_piece_reveal" do
    assert_difference('PuzzlepieceReveal.count', -1) do
      delete :destroy, id: @puzzle_piece_reveal
    end

    assert_redirected_to puzzle_piece_reveals_path
  end
end
