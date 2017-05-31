class QuiltBlocksController < ApplicationController
  before_action :set_quilt_block, only: [:show, :update, :destroy]
  #before_action :authorize_quilt_create except: [:index, :show, :create]

  # GET /quilt_blocks
  def index
    @quilt_blocks = QuiltBlock.all

    #render json: {status: 200, quilt_blocks: @quilt_blocks}
    render json: @quilt_blocks
  end

  # GET /quilt_blocks/1
  def show
    #@quilt_block = QuiltBlock.find_by_id(params[:id])
    #render json: {quilt_block: @quilt_block, status: 200}
    render json: @quilt_block
  end

  # POST /quilt_blocks
  def create
    #byebug
    @quilt_block = QuiltBlock.new(quilt_block_params)
    @user = get_current_user

    @quilt_block.user_id = @user.id
    # p @current_user.id
    #quilt_block_params[:user_id] = @user.id


    if @quilt_block.save
      render json: @quilt_block, status: :created, location: @quilt_block
    else
      render json: @quilt_block.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quilt_blocks/1
  # def update
  #   if @quilt_block.update(quilt_block_params) && @quilt_block.user_id == @user.id
  #     render json: {status: 200, quilt_block: @quilt_block}
  #   else
  #     render json: {status: 401, message: "You did not make this quilt_block and therefore cannot edit it!"}
  #   end
  # end

  # DELETE /quilt_blocks/1
  def destroy
    if @quilt_block.user_id == @user.id
      @quilt_block.destroy
      render json: {status: 200, message: "DELETED"}
    else
      render json: {status: 401, message: "You don't have permission to delete a recipe that isn't yours!"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quilt_block
      @quilt_block = QuiltBlock.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quilt_block_params
      params.require(:quilt_block).permit(:id, :img, :num_pieces, :piece_size, :difficulty, :title, :style, :user_id, :triangles, :squares)
    end
end
