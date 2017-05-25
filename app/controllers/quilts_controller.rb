class QuiltsController < ApplicationController
  before_action :set_quilt, only: [:show, :update, :destroy]

  # GET /quilts
  def index
    @quilts = Quilt.all

    render json: @quilts
  end

  # GET /quilts/1
  def show
    render json: @quilt
  end

  # POST /quilts
  def create
    @quilt = Quilt.new(quilt_params)

    if @quilt.save
      render json: @quilt, status: :created, location: @quilt
    else
      render json: @quilt.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quilts/1
  def update
    if @quilt.update(quilt_params)
      render json: @quilt
    else
      render json: @quilt.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quilts/1
  def destroy
    @quilt.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quilt
      @quilt = Quilt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quilt_params
      params.require(:quilt).permit(:num_colors, :size_block, :size_quilt, :difficulty, :piece_size)
    end
end
