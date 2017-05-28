class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :update, :destroy]

  # GET /positions
  def index
    @positions = Position.all

    render json: @positions.to_json(include: [:block, :piece])
  end

  # GET /positions/1
  def show
    render json: @position.to_json(include: [:block, :piece])
  end

  # POST /positions
  def create
    @position = Position.new(position_params)

    if @position.save
      render json: @position, status: :created, location: @position
    else
      render json: @position.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /positions/1
  def update
    #validate update with id check
    if @position.update(position_params)
      render json: @position
    else
      render json: @position.errors, status: :unprocessable_entity
    end
  end

  # DELETE /positions/1
  def destroy
    #validate destroy with the ids
    #if @recipe.user_id == @user.id
      #@recipe.destroy
      #render json: {status: 200, message: "DELETED"}
    #else
      #render json: {status: 401, message: "You don't have permission to delete a recipe that isn't yours!"}
    @position.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_position
      @position = Position.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def position_params
      params.require(:position).permit(:block_id, :piece_id, :grid_position)
    end
end
