require 'test_helper'

class PiecesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @piece = pieces(:one)
  end

  test "should get index" do
    get pieces_url, as: :json
    assert_response :success
  end

  test "should create piece" do
    assert_difference('Piece.count') do
      post pieces_url, params: { piece: { color: @piece.color, size: @piece.size } }, as: :json
    end

    assert_response 201
  end

  test "should show piece" do
    get piece_url(@piece), as: :json
    assert_response :success
  end

  test "should update piece" do
    patch piece_url(@piece), params: { piece: { color: @piece.color, size: @piece.size } }, as: :json
    assert_response 200
  end

  test "should destroy piece" do
    assert_difference('Piece.count', -1) do
      delete piece_url(@piece), as: :json
    end

    assert_response 204
  end
end
