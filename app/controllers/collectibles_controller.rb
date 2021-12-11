class CollectiblesController < ApplicationController
  before_action :set_collectible, only: [:show, :update, :destroy]

  # GET /collectibles
  def index
    @collectibles = Collectible.all

    render json: @collectibles
  end

  # GET /collectibles/1
  def show
    render json: @collectible
  end

  # POST /collectibles
  def create
    @collectible = Collectible.new(collectible_params)

    if @collectible.save
      render json: @collectible, status: :created, location: @collectible
    else
      render json: @collectible.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /collectibles/1
  def update
    if @collectible.update(collectible_params)
      render json: @collectible
    else
      render json: @collectible.errors, status: :unprocessable_entity
    end
  end

  # DELETE /collectibles/1
  def destroy
    @collectible.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collectible
      @collectible = Collectible.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def collectible_params
      params.require(:collectible).permit(:type, :title, :description, :photo, :icon)
    end
end
