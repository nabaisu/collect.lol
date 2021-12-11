class GathersController < ApplicationController
  before_action :set_gather, only: [:show, :update, :destroy]

  # GET /gathers
  def index
    @gathers = Gather.all

    render json: @gathers
  end

  # GET /gathers/1
  def show
    render json: @gather
  end

  # POST /gathers
  def create
    @gather = Gather.new(gather_params)

    if @gather.save
      render json: @gather, status: :created, location: @gather
    else
      render json: @gather.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /gathers/1
  def update
    if @gather.update(gather_params)
      render json: @gather
    else
      render json: @gather.errors, status: :unprocessable_entity
    end
  end

  # DELETE /gathers/1
  def destroy
    @gather.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gather
      @gather = Gather.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gather_params
      params.require(:gather).permit(:when, :how, :link, :extra_information, :description, :condition, :user_id, :stickerbook_id, :zone_id, :collectible_id)
    end
end
