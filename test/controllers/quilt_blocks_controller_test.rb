require 'test_helper'

class QuiltBlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quilt_block = quilt_blocks(:one)
  end

  test "should get index" do
    get quilt_blocks_url, as: :json
    assert_response :success
  end

  test "should create quilt_block" do
    assert_difference('QuiltBlock.count') do
      post quilt_blocks_url, params: { quilt_block: { difficulty: @quilt_block.difficulty, img: @quilt_block.img, num_pieces: @quilt_block.num_pieces, piece_size: @quilt_block.piece_size, style: @quilt_block.style, title: @quilt_block.title } }, as: :json
    end

    assert_response 201
  end

  test "should show quilt_block" do
    get quilt_block_url(@quilt_block), as: :json
    assert_response :success
  end

  test "should update quilt_block" do
    patch quilt_block_url(@quilt_block), params: { quilt_block: { difficulty: @quilt_block.difficulty, img: @quilt_block.img, num_pieces: @quilt_block.num_pieces, piece_size: @quilt_block.piece_size, style: @quilt_block.style, title: @quilt_block.title } }, as: :json
    assert_response 200
  end

  test "should destroy quilt_block" do
    assert_difference('QuiltBlock.count', -1) do
      delete quilt_block_url(@quilt_block), as: :json
    end

    assert_response 204
  end
end
