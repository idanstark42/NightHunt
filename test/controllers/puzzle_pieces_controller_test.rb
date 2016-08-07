require 'test_helper'

class PuzzlePiecesControllerTest < ActionController::TestCase
  setup do
    @puzzle_piece = puzzle_pieces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:puzzle_pieces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create puzzle_piece" do
    assert_difference('PuzzlePiece.count') do
      post :create, puzzle_piece: { image_uri: @puzzle_piece.image_uri, note: @puzzle_piece.note, x_coord: @puzzle_piece.x_coord, y_coord: @puzzle_piece.y_coord }
    end

    assert_redirected_to puzzle_piece_path(assigns(:puzzle_piece))
  end

  test "should show puzzle_piece" do
    get :show, id: @puzzle_piece
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @puzzle_piece
    assert_response :success
  end

  test "should update puzzle_piece" do
    patch :update, id: @puzzle_piece, puzzle_piece: { image_uri: @puzzle_piece.image_uri, note: @puzzle_piece.note, x_coord: @puzzle_piece.x_coord, y_coord: @puzzle_piece.y_coord }
    assert_redirected_to puzzle_piece_path(assigns(:puzzle_piece))
  end

  test "should destroy puzzle_piece" do
    assert_difference('PuzzlePiece.count', -1) do
      delete :destroy, id: @puzzle_piece
    end

    assert_redirected_to puzzle_pieces_path
  end
end
