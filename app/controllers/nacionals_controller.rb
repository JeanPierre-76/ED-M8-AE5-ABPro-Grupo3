class NacionalsController < ApplicationController
  before_action :set_nacional, only: %i[ show edit update destroy ]

  # GET /nacionals or /nacionals.json
  def index
    @nacionals = Nacional.all
  end

  # GET /nacionals/1 or /nacionals/1.json
  def show
  end

  # GET /nacionals/new
  def new
    @nacional = Nacional.new
  end

  # GET /nacionals/1/edit
  def edit
  end

  # POST /nacionals or /nacionals.json
  def create
    @nacional = Nacional.new(nacional_params)

    respond_to do |format|
      if @nacional.save
        format.html { redirect_to nacional_url(@nacional), notice: "Nacional was successfully created." }
        format.json { render :show, status: :created, location: @nacional }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @nacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nacionals/1 or /nacionals/1.json
  def update
    respond_to do |format|
      if @nacional.update(nacional_params)
        format.html { redirect_to nacional_url(@nacional), notice: "Nacional was successfully updated." }
        format.json { render :show, status: :ok, location: @nacional }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @nacional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nacionals/1 or /nacionals/1.json
  def destroy
    @nacional.destroy

    respond_to do |format|
      format.html { redirect_to nacionals_url, notice: "Nacional was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nacional
      @nacional = Nacional.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def nacional_params
      params.require(:nacional).permit(:encabezado, :cuepor, :link)
    end
end
