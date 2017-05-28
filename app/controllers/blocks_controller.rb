class BlocksController < ApplicationController
  before_action :set_block, only: [:show, :update, :destroy]

  # GET /blocks
  def index
    @blocks = Block.all

    render json: @blocks.to_json(include: :pieces)
  end

  # GET /blocks/1
  def show
    render json: @block.to_json(include: :pieces)
    # one_recipe =
    # Recipe.find_by_id(params[:id])
    #
    # render json: {
    #     recipes: one_recipe,
    #     status: 200 }
  end

  # POST /blocks
  def create
    @block = Block.new(block_params)
    #@user = get_current_user
    #@recipe.user_id = @user.id
    if @block.save
      render json: @block, status: :created, location: @block
    else
      render json: @block.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blocks/1
  def update
    #validate owner of block
    if @block.update(block_params)
      render json: @block
    else
      render json: @block.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blocks/1
  def destroy
    #validate owner of block
    @block.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def block_params
      #going to add foreign key user_id
      params.require(:block).permit(:title, :difficulty)
    end
end
