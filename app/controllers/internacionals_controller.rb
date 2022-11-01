class InternacionalsController < ApplicationController
  before_action :set_internacional, only: %i[ show edit update destroy ]

  # GET /internacionals or /internacionals.json
  def index
    @internacionals = Internacional.all
  end

  # GET /internacionals/1 or /internacionals/1.json
  def show
  end

  # GET /internacionals/new
  def new
    @internacional = Internacional.new
  end

  # GET /internacionals/1/edit
  def edit
  end

  # POST /internacionals or /internacionals.json
  def create
    @internacional = Internacional.new(internacional_params)

    respond_to do |format|
      if @internacional.save
        format.html { redirect_to internacional_url(@internacional), notice: "Internacional was successfully created." }
        format.json { render :show, status: :created, location: @internacional }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @internacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internacionals/1 or /internacionals/1.json
  def update
    respond_to do |format|
      if @internacional.update(internacional_params)
        format.html { redirect_to internacional_url(@internacional), notice: "Internacional was successfully updated." }
        format.json { render :show, status: :ok, location: @internacional }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @internacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internacionals/1 or /internacionals/1.json
  def destroy
    @internacional.destroy

    respond_to do |format|
      format.html { redirect_to internacionals_url, notice: "Internacional was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internacional
      @internacional = Internacional.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def internacional_params
      params.require(:internacional).permit(:encabezado, :cuepor, :link)
    end
end
