require 'test_helper'

class QuiltsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quilt = quilts(:one)
  end

  test "should get index" do
    get quilts_url, as: :json
    assert_response :success
  end

  test "should create quilt" do
    assert_difference('Quilt.count') do
      post quilts_url, params: { quilt: { difficulty: @quilt.difficulty, num_colors: @quilt.num_colors, piece_size: @quilt.piece_size, size_block: @quilt.size_block, size_quilt: @quilt.size_quilt } }, as: :json
    end

    assert_response 201
  end

  test "should show quilt" do
    get quilt_url(@quilt), as: :json
    assert_response :success
  end

  test "should update quilt" do
    patch quilt_url(@quilt), params: { quilt: { difficulty: @quilt.difficulty, num_colors: @quilt.num_colors, piece_size: @quilt.piece_size, size_block: @quilt.size_block, size_quilt: @quilt.size_quilt } }, as: :json
    assert_response 200
  end

  test "should destroy quilt" do
    assert_difference('Quilt.count', -1) do
      delete quilt_url(@quilt), as: :json
    end

    assert_response 204
  end
end
