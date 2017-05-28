class QuiltBlocksController < ApplicationController
  before_action :set_quilt_block, only: [:show, :update, :destroy]

  # GET /quilt_blocks
  def index
    @quilt_blocks = QuiltBlock.all

    render json: @quilt_blocks
  end

  # GET /quilt_blocks/1
  def show
    render json: @quilt_block
  end

  # POST /quilt_blocks
  def create
    @quilt_block = QuiltBlock.new(quilt_block_params)

    if @quilt_block.save
      render json: @quilt_block, status: :created, location: @quilt_block
    else
      render json: @quilt_block.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quilt_blocks/1
  def update
    if @quilt_block.update(quilt_block_params)
      render json: @quilt_block
    else
      render json: @quilt_block.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quilt_blocks/1
  def destroy
    @quilt_block.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quilt_block
      @quilt_block = QuiltBlock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quilt_block_params
      params.require(:quilt_block).permit(:img, :num_pieces, :piece_size, :difficulty, :title, :style)
    end
end
