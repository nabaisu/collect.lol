class StickerbooksController < ApplicationController
  before_action :set_stickerbook, only: [:show, :update, :destroy]

  # GET /stickerbooks
  def index
    @stickerbooks = Stickerbook.all

    render json: @stickerbooks
  end

  # GET /stickerbooks/1
  def show
    render json: @stickerbook
  end

  # POST /stickerbooks
  def create
    @stickerbook = Stickerbook.new(stickerbook_params)

    if @stickerbook.save
      render json: @stickerbook, status: :created, location: @stickerbook
    else
      render json: @stickerbook.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stickerbooks/1
  def update
    if @stickerbook.update(stickerbook_params)
      render json: @stickerbook
    else
      render json: @stickerbook.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stickerbooks/1
  def destroy
    @stickerbook.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stickerbook
      @stickerbook = Stickerbook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stickerbook_params
      params.require(:stickerbook).permit(:title, :created_by, :rules_id)
    end
end
